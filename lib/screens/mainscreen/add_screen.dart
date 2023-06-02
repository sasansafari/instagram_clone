import 'package:flutter/material.dart';
import 'package:tec/res/colors.dart';
import '../../gen/assets.gen.dart';
import '../../widgets/custom_tabbar_widget.dart';
import '../../widgets/image_action_custom_widget.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBarWidget(context),
      body: Stack(children: [
        _buildAddImageScreenBody(size),
        _buildTabBarWidget(),
      ]),
    );
  }

  Widget _buildAddImageScreenBody(Size size) {
    return Positioned.fill(
      child: CustomScrollView(
        slivers: [
          // ******** show selected media or medias ********
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: size.height / 2.5,
            flexibleSpace: Stack(
              children: [
                Container(
                  color: Colors.blue,
                ),
                _buildActionImageList()
              ],
            ),
          )
        ],
      ),
    );
  }

  CustomTabBarWidget _buildTabBarWidget() {
    return CustomTabBarWidget(
      isBottom: true,
      items: [
        CustomTabBarItem.bottom(
          isSelected: true,
          onTap: () {},
          title: 'Library',
        ),
        CustomTabBarItem.bottom(
          isSelected: false,
          onTap: () {},
          title: 'Photo',
        ),
        CustomTabBarItem.bottom(
          isSelected: false,
          onTap: () {},
          title: 'Video',
        ),
      ],
    );
  }

  CustomAddImageAppBarWidget _buildAppBarWidget(BuildContext context) {
    return CustomAddImageAppBarWidget(
      title: 'Recents',
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
    );
  }

  Widget _buildActionImageList() {
    return Positioned(
        bottom: 10.2,
        right: 10,
        child: Row(
          children: [
            ImageActionsCustomWidget(
                child: Assets.icons.boomerang.svg(fit: BoxFit.scaleDown)),
            ImageActionsCustomWidget(
                child: Assets.icons.combinePhoto.svg(fit: BoxFit.scaleDown)),
            ImageActionsCustomWidget(
                width: 153,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Assets.icons.selectMultiple.svg(fit: BoxFit.scaleDown),
                    const Text(
                      'SELECT MULTIPLE',
                      style: TextStyle(color: Colors.white,fontSize: 14),
                    )
                  ],
                )),
          ],
        ));
  }
}

// ******** create custom AppBar ********
class CustomAddImageAppBarWidget extends StatelessWidget
    with PreferredSizeWidget {
  final double appBarHeight;
  final double appBarPadding;
  final String title;
  final Widget? backButton;
  final Widget? nextButton;
  final Color appBarColor;

  const CustomAddImageAppBarWidget(
      {Key? key,
      this.appBarHeight = 50,
      required this.title,
      this.backButton,
      required this.nextButton,
      required this.appBarPadding,
      required this.appBarColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: appBarColor,
      padding: EdgeInsets.all(appBarPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backButton ?? const SizedBox(),
          Align(
            alignment: Alignment.center,
            child: Row(
              children: [Text(title), const Icon(Icons.expand_more)],
            ),
          ),
          nextButton ?? const SizedBox()
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
