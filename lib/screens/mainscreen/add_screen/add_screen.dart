import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:tec/res/colors.dart';
import 'package:tec/screens/mainscreen/add_screen/components/custom_app_bar.dart';
import '../../../gen/assets.gen.dart';
import '../../../widgets/custom_asset_widget.dart';
import '../../../widgets/custom_tabbar_widget.dart';
import '../../../widgets/image_action_custom_widget.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> with TickerProviderStateMixin {
  late RequestType selectedRequestType;
  AssetPathEntity? selectedAlbum;
  AssetEntity? selectedImage;
  List<AssetPathEntity> albumList = [];
  List<AssetEntity> assetList = [];

  @override
  void initState() {
    /*  RequestType.image for just image
     RequestType.video for just video 
     load common assets(image and video) */
    selectedRequestType = RequestType.common;
    // ******** load all albums ********
    MediaServices.loadAlbums(selectedRequestType).then((value) {
      setState(() {
        albumList = value;
        selectedAlbum = value[0];
      });
      // ******** load recent assets ********
      MediaServices.loadAssets(selectedAlbum!).then((value) {
        setState(() {
          assetList = value;
          selectedImage = value[0];
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBarWidget(context, size),
      body: Stack(
        children: [
          _buildAddImageScreenBody(size, assetList),
          _buildTabBarWidget(),
        ],
      ),
    );
  }

  Widget _buildAddImageScreenBody(Size size, List<AssetEntity> assetList) {
    const Widget loadingWidget = Center(
      child: CircularProgressIndicator(),
    );
    return Positioned.fill(
      child: assetList.isEmpty
          ? loadingWidget
          : CustomScrollView(
              slivers: [
                // ******** show selected media or medias ********
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: size.height / 2.5,
                  floating: true,
                  snap: true,
                  flexibleSpace: Stack(
                    children: [
                      _buildSelectedImageWidget(),
                      _buildActionImageList()
                    ],
                  ),
                ),
                _buildGridWidget(assetList),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 60),
                )
              ],
            ),
    );
  }

  Widget _buildGridWidget(List<AssetEntity> assetList) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final AssetEntity assetEntity = assetList[index];
          return CustomAssetWidget(assetEntity: assetEntity);
        },
        childCount: assetList.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
    );
  }

  Widget _buildSelectedImageWidget() {
    return Positioned.fill(
      child: AssetEntityImage(
        selectedImage!,
        isOriginal: false,
        thumbnailSize: const ThumbnailSize.square(250),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Center(
          child: Icon(
            Icons.error,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  CustomTabBarWidget _buildTabBarWidget() {
    final TabController tabController = TabController(length: 3, vsync: this);
    return CustomTabBarWidget(
      tabController: tabController,
      isBottom: true,
      onTap: (index) {
        switch (index) {
          case 0:
            return selectedRequestType != RequestType.common
                ? loadAlbumsMethod(RequestType.common)
                : null;
          case 1:
            return selectedRequestType != RequestType.image
                ? loadAlbumsMethod(RequestType.image)
                : null;
          case 2:
            return selectedRequestType != RequestType.video
                ? loadAlbumsMethod(RequestType.video)
                : null;
        }
      },
      items: const [
        Tab(
          text: 'Library',
        ),
        Tab(
          text: 'Photo',
        ),
        Tab(
          text: 'Video',
        ),
      ],
    );
  }

  Future<void> loadAlbumsMethod(RequestType requestType) {
    return MediaServices.loadAlbums(requestType).then((value) {
      selectedRequestType = requestType;
      setState(() {
        albumList = value;
        selectedAlbum = value[0];
        MediaServices.loadAssets(selectedAlbum!).then((value) {
          setState(() {
            assetList = value;
            selectedImage = value[0];
          });
        });
      });
    });
  }

  CustomAddImageAppBarWidget _buildAppBarWidget(
    BuildContext context,
    Size size,
  ) {
    return CustomAddImageAppBarWidget(
      title: selectedAlbum!.name,
      backButton: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      nextButton: GestureDetector(
        onTap: () {},
        child: const Text(
          'Next',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      appBarPadding: 14,
      appBarColor: MyColors.customAppBarBackgroundColor,
      titleOnTap: () => customBottomSheet(size, context, albumList),
      // albumList: albumList,
    );
  }

  Future<dynamic> customBottomSheet(
    Size size,
    BuildContext context,
    List items,
  ) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 3,
            width: size.width / 7,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final AssetPathEntity albumItem = items[index];

              return ListTile(
                onTap: () {
                  setState(() {
                    selectedAlbum = items[index];
                    MediaServices.loadAssets(selectedAlbum!);
                    Navigator.pop(context);
                  });
                },
                title: Text(albumItem.name.toString()),
              );
            },
          ),
        ],
      ),
      context: context,
    );
  }

  Widget _buildActionImageList() {
    return Positioned(
      bottom: 10.2,
      right: 10,
      child: Row(
        children: [
          ImageActionsCustomWidget(
            child: Assets.icons.boomerang.svg(fit: BoxFit.scaleDown),
          ),
          ImageActionsCustomWidget(
            child: Assets.icons.combinePhoto.svg(fit: BoxFit.scaleDown),
          ),
          ImageActionsCustomWidget(
            width: 153,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Assets.icons.selectMultiple.svg(fit: BoxFit.scaleDown),
                const Text(
                  'SELECT MULTIPLE',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ******** load medias from storage ********
class MediaServices {
  static Future loadAlbums(RequestType requestType) async {
    var permission = await PhotoManager.requestPermissionExtend();
    List<AssetPathEntity> albumList = [];

    if (permission.isAuth == true) {
      // ******** success ********
      albumList = await PhotoManager.getAssetPathList(type: requestType);
    } else {
      // ******** failed (get access) ********
      PhotoManager.openSetting();
    }
    return albumList;
  }

  static Future loadAssets(AssetPathEntity selectedAlbum) async {
    List<AssetEntity> assetList = await selectedAlbum.getAssetListRange(
      start: 0,
      // ignore: deprecated_member_use
      end: selectedAlbum.assetCount,
    );
    return assetList;
  }
}
