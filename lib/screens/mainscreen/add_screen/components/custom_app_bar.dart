import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:tec/res/dimens.dart';
// ******** create custom AppBar ********

class CustomAddImageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double appBarHeight;
  final double appBarPadding;
  final String title;
  final Widget? backButton;
  final Widget? nextButton;
  final Color appBarColor;
  final List<AssetPathEntity> albumList;

  const CustomAddImageAppBarWidget({
    Key? key,
    this.appBarHeight = 50,
    required this.title,
    this.backButton,
    required this.nextButton,
    required this.appBarPadding,
    required this.appBarColor,
    required this.albumList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: appBarColor,
        padding: EdgeInsets.all(appBarPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backButton ?? const SizedBox(),
            GestureDetector(
              onTap: () => buildBottomSheet(context, size),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [Text(title), const Icon(Icons.expand_more)],
                ),
              ),
            ),
            nextButton ?? const SizedBox()
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildBottomSheet(BuildContext context, Size size) {
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
            width: size.width/7,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              final AssetPathEntity albumItem = albumList[index];

              return ListTile(
                onTap: () {},
                title: Text(albumItem.name.toString()),
              );
            },
          ),
        ],
      ),
      context: context,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
