import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:tec/res/colors.dart';
import 'package:tec/screens/mainscreen/add_screen/components/custom_app_bar.dart';
import '../../../widgets/custom_tabbar_widget.dart';
import 'components/grid_view_item.dart';
import 'components/selected_asset_widget.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> with TickerProviderStateMixin {
  late RequestType selectedRequestType;
  AssetPathEntity? selectedAlbum;
  List<AssetPathEntity> albumList = [];
  List<AssetEntity> assetList = [];
  AssetEntity? selectedAsset;
  List<AssetEntity> multipleSelectedAsset = [];
  bool isMultiple = false;
  late TabController _controller;

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
          selectedAsset = value[0];
        });
      });
    });
    super.initState();
    // ******** initial tab controller ********
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingWidget = const Center(
      child: CircularProgressIndicator(),
    );
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // ******** add image screen app bar ********\
      appBar: buildAppBarWidget(context, size),
      body: Stack(
        children: [
          Positioned.fill(
            child: assetList.isEmpty
                ? loadingWidget
                : CustomScrollView(
                    slivers: [
                      // ******** show selected media or medias ********
                      buildSelectedAssetWidget(size),
                      // ******** gird view ********
                      buildGridViewWidget(),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 60),
                      )
                    ],
                  ),
          ),
          // ******** tab bar widget ********
          buildTabBarWidget(),
        ],
      ),
    );
  }

  CustomTabBarWidget buildTabBarWidget() {
    return CustomTabBarWidget(
      tabController: _controller,
      isBottom: true,
      onTap: (itemIndex) {
        switch (itemIndex) {
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
        // setState(() {if(tabController.index!=itemIndex){
        //   tabController.index=itemIndex;
        // }});
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

  SliverGrid buildGridViewWidget() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final AssetEntity assetEntity = assetList[index];
          return GridViewItem(
            onTap: () {
              setState(() {
                if (isMultiple == false) {
                  selectedAsset = assetList[index];
                } else {
                  if (!multipleSelectedAsset.contains(assetList[index]) &&
                      multipleSelectedAsset.length < 10) {
                    multipleSelectedAsset.add(assetList[index]);
                    selectedAsset = assetList[index];
                  } else {
                    multipleSelectedAsset.remove(assetList[index]);
                  }
                }
              });
            },
            assetEntity: assetEntity,
            isMultiple: isMultiple,
            multipleSelectedAsset: multipleSelectedAsset,
          );
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

  CustomAddImageAppBarWidget buildAppBarWidget(
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
      titleOnTap: () => showBottomSheet(size, context, albumList),
      // albumList: albumList,
    );
  }

  SliverAppBar buildSelectedAssetWidget(Size size) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: size.height / 2.5,
      floating: true,
      snap: true,
      flexibleSpace: SelectedAssetWidget(
        selectedAsset: selectedAsset,
        isMultiple: isMultiple,
        changeIsMultiple: () {
          setState(() {
            isMultiple = !isMultiple;
            if (isMultiple == false) {
              multipleSelectedAsset = [];
            }
          });
        },
      ),
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
            selectedAsset = value[0];
          });
        });
      });
    });
  }

  Future<dynamic> showBottomSheet(
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
