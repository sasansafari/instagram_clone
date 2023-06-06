import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/res/constant/colors.dart';
import 'package:tec/res/constant/dimens.dart';
import 'package:tec/res/constant/my_strings.dart';
import 'package:tec/widgets/item_story.dart';

class UserProfileScreen extends StatelessWidget {
  //final String textTitle;
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var sizeMediaQuery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.secondaryColorUi,
        //access to controller TabBar
        body: DefaultTabController(
          length: MyDimens.num2.toInt(),
          child: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                //AppBar
                SliverAppBarWidget(
                    sizeMediaQuery: sizeMediaQuery, textTheme: textTheme),
                //widgets between Appbar and TabBar
                SliverToBoxAdapter(
                  child: GetHeaderProfile(
                    sizeMediaQuery: sizeMediaQuery,
                    textTheme: textTheme,
                  ),
                ),
                //Top line of TabBar
                SliverToBoxAdapter(
                    child: Container(
                  width: sizeMediaQuery.width,
                  height: 1,
                  color: MyColors.borderOvalProfileScreen,
                )),
                //TabBar & Pinned
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: TabBarViewDelegate(
                    TabBar(
                      indicatorPadding:
                          const EdgeInsets.only(bottom: MyDimens.num1),
                      indicatorWeight: MyDimens.num1,
                      indicatorColor: MyColors.indicatorColor,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.blue,
                      tabs: [
                        Tab(
                          icon: Assets.icons.gridIconSelected.svg(),
                        ),
                        Tab(
                          icon: Assets.icons.tagsIconInSelected.svg(),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            //The body of the NestedScrollView which includes tab bar items and their contents
            body: TabBarView(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MyDimens.num3.toInt(),
                        mainAxisSpacing: MyDimens.num3,
                        crossAxisSpacing: MyDimens.num3,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            color: Colors.red,
                          );
                        },
                        childCount: MyDimens.num100.toInt(),
                      ),
                    )
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MyDimens.num3.toInt(),
                        mainAxisSpacing: MyDimens.num5,
                        crossAxisSpacing: MyDimens.num5,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            color: Colors.blueAccent,
                          );
                        },
                        childCount: MyDimens.num100.toInt(),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    Key? key,
    required this.sizeMediaQuery,
    required this.textTheme,
  }) : super(key: key);

  final Size sizeMediaQuery;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: MyColors.secondaryColorUi,
      pinned: true,
      actions: [
        Padding(
          padding:
              EdgeInsets.only(right: sizeMediaQuery.width / MyDimens.num18),
          child: Assets.icons.menu.svg(),
        ),
      ],
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: sizeMediaQuery.width / MyDimens.num12),
            Assets.icons.privateIcon.svg(),
            SizedBox(width: sizeMediaQuery.width / MyDimens.num50),
            Text(
              "jacob_w",
              style: textTheme.displayLarge,
            ),
            const SizedBox(width: MyDimens.num5),
            Assets.icons.accountsList.svg(),
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
      color: MyColors.secondaryColorUi,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}

//Widget Header profile in NestedScrollview
class GetHeaderProfile extends StatelessWidget {
  const GetHeaderProfile({
    Key? key,
    required this.sizeMediaQuery,
    required this.textTheme,
  }) : super(key: key);

  final Size sizeMediaQuery;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sizeMediaQuery.width / MyDimens.num16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Item Image Profile
              ItemStory(
                width: MyDimens.num96,
                height: MyDimens.num96,
                sizeInner: MyDimens.num86,
                sizeOuter: MyDimens.num86,
                image: Assets.images.imgMe.provider(),
                sizedBoxHeight: MyDimens.num0,
                margin: const EdgeInsets.all(MyDimens.num0),
                visible: false,
                textItemStoryBox: "",
              ),
              ColumnTextInfoProfile(
                  textChangeable: '54',
                  text: MyStrings.postsUserProfile,
                  textTheme: textTheme),
              ColumnTextInfoProfile(
                  textChangeable: '834',
                  text: MyStrings.followersUserProfile,
                  textTheme: textTheme),
              ColumnTextInfoProfile(
                  textChangeable: '162',
                  text: MyStrings.followingUserProfile,
                  textTheme: textTheme),
            ],
          ),
          const SizedBox(height: MyDimens.num12),
          //Bio user Profile
          BioUserProfile(
              mainText: "acob west",
              secondText: 'Digital goodies designer ',
              clickableText: '@pixsellz',
              thirdText: "Everything is designed",
              textTheme: textTheme),
          const SizedBox(height: 10),
          //Edit Profile Button
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Edit Profile",
              style: textTheme.displayMedium,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(
                  color: MyColors.borderEditProfileColor, width: MyDimens.num1),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(MyDimens.num6),
                ),
              ),
              elevation: MyDimens.num0,
              minimumSize: Size(
                  sizeMediaQuery.width, sizeMediaQuery.height / MyDimens.num22),
            ),
          ),
          const SizedBox(
            height: MyDimens.num10,
          ),
          //
          SizedBox(
            height: 110,
            child: ListView.builder(
              itemCount: MyDimens.num10.toInt(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => index == MyDimens.num0
                  ? ItemAddStory(
                      width: MyDimens.num64,
                      height: MyDimens.num64,
                      containerOne: MyDimens.num64,
                      containerTwo: MyDimens.num64)
                  : ItemStory(
                      width: MyDimens.num64,
                      height: MyDimens.num64,
                      sizeInner: MyDimens.num56,
                      sizeOuter: MyDimens.num56,
                      textItemStoryBox: "Friends",
                      visible: true,
                      textTheme: textTheme,
                      margin:
                          const EdgeInsets.symmetric(horizontal: MyDimens.num8),
                      sizedBoxHeight: MyDimens.num5,
                      image: Assets.images.imgMe.provider(),
                    ), //
            ),
          ),
        ],
      ),
    );
  }
}

//custom widget - Bio User Profile - Under the profile picture
class BioUserProfile extends StatelessWidget {
  const BioUserProfile({
    Key? key,
    required this.textTheme,
    required this.mainText,
    required this.secondText,
    required this.clickableText,
    required this.thirdText,
  }) : super(key: key);

  final TextTheme textTheme;
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
          style: textTheme.displayMedium,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: secondText,
                style: textTheme.displaySmall,
              ),
              TextSpan(
                text: clickableText,
                style: textTheme.labelMedium,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('asasdasdasdas000000000000000000000sd');
                  },
              ),
            ],
          ),
        ),
        Text(
          thirdText,
          style: textTheme.displaySmall,
        ),
      ],
    );
  }
}

//Custom Widget - Text Info Profile post-followers-following
class ColumnTextInfoProfile extends StatelessWidget {
  const ColumnTextInfoProfile({
    Key? key,
    required this.textTheme,
    required this.textChangeable,
    required this.text,
  }) : super(key: key);

  final TextTheme textTheme;
  final String textChangeable;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          textChangeable,
          style: textTheme.displayLarge,
        ),
        Text(
          text,
          style: textTheme.displaySmall,
        ),
      ],
    );
  }
}

//Custom widget - Item Add Story profile page
class ItemAddStory extends StatelessWidget {
  final double width;
  final double height;
  final double containerOne;
  final double containerTwo;

  ItemAddStory({
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
          margin: const EdgeInsets.only(right: MyDimens.num8),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: MyColors.borderEditProfileColor,
            borderRadius: BorderRadius.circular(containerOne),
          ),
          child: Padding(
            padding: const EdgeInsets.all(MyDimens.num1),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: MyColors.secondaryColorUi,
                borderRadius: BorderRadius.circular(containerTwo),
              ),
              child: Padding(
                padding: const EdgeInsets.all(MyDimens.num20),
                child: Assets.icons.addStory.svg(),
              ),
            ),
          ),
        ),
        const SizedBox(height: MyDimens.num5),
        const Text(
          MyStrings.newAddHighlight,
        ),
      ],
    );
  }
}
