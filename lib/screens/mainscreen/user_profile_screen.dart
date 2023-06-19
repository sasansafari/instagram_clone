import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:tec/extensions/space_xy_extension.dart';
import 'package:tec/res/colors.dart';
import 'package:tec/res/strings.dart';
import 'package:tec/res/styles.dart';

import '../../../gen/assets.gen.dart';
import '../../../widgets/custom_drawer.dart';
import '../../widgets/item_story.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int _selectedTabIndex = 0;
  var showDrawer = false;

  @override
  Widget build(BuildContext context) {
    var sizeMediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
//accesstocontrollerTabBar
        body: SliderDrawer(
          slideDirection: SlideDirection.RIGHT_TO_LEFT,
          splashColor: MyColors.secondaryColorUi,
//key:_key,
          appBar: SliderAppBar(
            appBarPadding: const EdgeInsets.symmetric(horizontal: 16),
            appBarColor: MyColors.secondaryColorUi,
            isTitleCenter: true,
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: sizeMediaQuery.width / 12.0),
                  Assets.icons.userprofilescreen.privateIconUps.svg(),
                  SizedBox(width: sizeMediaQuery.width / 50.0),
                  Text(
                    MyStrings.userNameUPS,
                    style: MyStyles.getBoldTextStyleUPS(),
                  ),
                  5.0.spaceX,
                  Assets.icons.userprofilescreen.accountsListIconUps.svg(),
                ],
              ),
            ),
          ),
          slider: const CustomDrawer(),
          child: Container(
            color: MyColors.secondaryColorUi,
            child: DefaultTabController(
              length: 2.0.toInt(),
              child: NestedScrollView(
                headerSliverBuilder: (context, isScrolled) {
                  return [
//AppBar
                    _sliverAppBarWidget(),
//widgetsbetweenAppbarandTabBar
                    SliverToBoxAdapter(
                      child: _getHeaderProfile(
                        context: context,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 90,
                        child: ListView.builder(
                          itemCount: 10.0.toInt(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => index == 0.0
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    left: sizeMediaQuery.width / 16.0,
                                  ),
                                  child: const ItemAddStory(
                                    width: 64.0,
                                    height: 64.0,
                                    containerOne: 64.0,
                                    containerTwo: 64.0,
                                  ),
                                )
                              : ItemStory(
                                  width: 64.0,
                                  height: 64.0,
                                  sizeInner: 56.0,
                                  sizeOuter: 56.0,
                                  textItemStoryBox:
                                      MyStrings.textItemStoryBoxUPS,
                                  visible: true,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  sizedBoxHeight: 5.0,
                                  image:
                                      Assets.images.stories.stories9.provider(),
                                ), //
                        ),
                      ),
                    ),
//ToplineofTabBar
                    const SliverToBoxAdapter(
                      child: Divider(
                        color: MyColors.borderStoryUPS,
                        thickness: 0.5,
                      ),
                    ),
//TabBar&Pinned
                    SliverPersistentHeader(
                      pinned: true,
                      floating: false,
                      delegate: TabBarViewDelegate(
                        TabBar(
                          indicatorPadding: const EdgeInsets.only(bottom: 1.0),
                          indicatorWeight: 1.0,
                          indicatorColor: MyColors.indicatorColorUPS,
//labelColor:Colors.yellow,
//unselectedLabelColor:Colors.yellow,
                          tabs: [
                            Tab(
                              icon: _selectedTabIndex == 0
                                  ? Assets.icons.userprofilescreen
                                      .gridIconSelectedUps
                                      .svg()
                                  : Assets.icons.userprofilescreen
                                      .gridIconInSelectedUps
                                      .svg(),
                            ),
                            Tab(
                              icon: _selectedTabIndex == 1
                                  ? Assets.icons.userprofilescreen
                                      .tagsIconSelectedUps
                                      .svg()
                                  : Assets.icons.userprofilescreen
                                      .tagsIconInSelectedUps
                                      .svg(),
                            ),
                          ],
                          onTap: (index) {
                            setState(() {
                              _selectedTabIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                  ];
                },
//ThebodyoftheNestedScrollViewwhichincludestabbaritemsandtheircontents
                body: TabBarView(
                  children: [
                    CustomScrollView(
                      slivers: [
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3.0.toInt(),
                            mainAxisSpacing: 3.0,
                            crossAxisSpacing: 3.0,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Container(
                                color: Colors.red,
                              );
                            },
                            childCount: 100.0.toInt(),
                          ),
                        )
                      ],
                    ),
                    CustomScrollView(
                      slivers: [
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3.0.toInt(),
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 5.0,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Container(
                                color: Colors.blueAccent,
                              );
                            },
                            childCount: 100.0.toInt(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _sliverAppBarWidget() {
  return const SliverAppBar(
    floating: true,
    pinned: true,
    toolbarHeight: 0.01,
    elevation: 0.9,
  );
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: MyColors.secondaryColorUi,
      child: _tabBar,
    );
  }

  @override
//TODO:implementmaxExtent
  double get maxExtent => _tabBar.preferredSize.height;

  @override
//TODO:implementminExtent
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariantSliverPersistentHeaderDelegateoldDelegate) {
//TODO:implementshouldRebuild
    return true;
  }
}

//WidgetHeaderprofileinNestedScrollview
Widget _getHeaderProfile({required BuildContext context}) {
  var sizeMediaQuery = MediaQuery.of(context).size;

  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: sizeMediaQuery.width / 16.0,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
//ItemImageProfile
            ItemStory(
              width: 96.0,
              height: 96.0,
              sizeInner: 86.0,
              sizeOuter: 86.0,
              image: Assets.images.stories.stories1.provider(),
              sizedBoxHeight: 0.0,
              margin: const EdgeInsets.all(0.0),
              visible: false,
              textItemStoryBox: '',
            ),
            const ColumnTextInfoProfile(
              textChangeable: '54',
              text: MyStrings.postsUPS,
            ),
            const ColumnTextInfoProfile(
              textChangeable: '834',
              text: MyStrings.followersUPS,
            ),
            const ColumnTextInfoProfile(
              textChangeable: '162',
              text: MyStrings.followingUPS,
            ),
          ],
        ),
        12.0.spaceY,
//BiouserProfile
        const BioUserProfile(
          mainText: 'acobwest',
          secondText: 'Digitalgoodiesdesigner',
          clickableText: '@pixsellz',
          thirdText: 'Everythingisdesigned',
        ),
        10.0.spaceY,
//EditProfileButton
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(
              color: MyColors.borderBottomEditProfileColorUPS,
              width: 2.0,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            elevation: 0.0,
            minimumSize: Size(
              sizeMediaQuery.width,
              sizeMediaQuery.height / 22.0,
            ),
          ),
          child: Text(
            'EditProfile',
            style: MyStyles.getSemiRegularTextStyleUPS(),
          ),
        ),
        10.0.spaceY,
      ],
    ),
  );
}

//customwidget-BioUserProfile-Undertheprofilepicture
class BioUserProfile extends StatelessWidget {
  const BioUserProfile({
    Key? key,
    required this.mainText,
    required this.secondText,
    required this.clickableText,
    required this.thirdText,
  }) : super(key: key);

  final String mainText;
  final String secondText;
  final String clickableText;
  final String thirdText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mainText,
          style: MyStyles.getSemiBoldTextStyleUPS(),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: secondText,
                style: MyStyles.getSemiRegularTextStyleUPS(),
              ),
              TextSpan(
                text: clickableText,
                style: MyStyles.getClickableTextStyleUPS(),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
//print('asasdasdasdas000000000000000000000sd');
                  },
              ),
            ],
          ),
        ),
        Text(
          thirdText,
          style: MyStyles.getSemiRegularTextStyleUPS(),
        ),
      ],
    );
  }
}

//CustomWidget-TextInfoProfilepost-followers-following
class ColumnTextInfoProfile extends StatelessWidget {
  const ColumnTextInfoProfile({
    Key? key,
    required this.textChangeable,
    required this.text,
  }) : super(key: key);

  final String textChangeable;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          textChangeable,
          style: MyStyles.getBoldTextStyleUPS(),
        ),
        Text(
          text,
          style: MyStyles.getSemiRegularTextStyleUPS(),
        ),
      ],
    );
  }
}

//Customwidget-ItemAddStoryprofilepage
class ItemAddStory extends StatelessWidget {
  final double width;
  final double height;
  final double containerOne;
  final double containerTwo;

  const ItemAddStory({
    Key? key,
    required this.width,
    required this.height,
    required this.containerOne,
    required this.containerTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8.0),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: MyColors.borderStoryUPS,
            borderRadius: BorderRadius.circular(containerOne),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: MyColors.secondaryColorUi,
                borderRadius: BorderRadius.circular(containerTwo),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Assets.icons.userprofilescreen.addStoryIconUps.svg(),
              ),
            ),
          ),
        ),
        5.0.spaceY,
        const Padding(
          padding: EdgeInsets.only(right: 6.0),
          child: Text(
            MyStrings.newAddHighlightUPS,
          ),
        ),
      ],
    );
  }
}
