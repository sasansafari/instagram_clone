import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/res/constant/colors.dart';
import 'package:tec/res/constant/dimens.dart';
import 'package:tec/res/constant/my_strings.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var sizeMediaQuery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.secondaryColorUi,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizeMediaQuery.width / MyDimens.num16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemOval(
                      width: MyDimens.num96,
                      height: MyDimens.num96,
                      sizeInner: MyDimens.num86,
                      sizeOuter: MyDimens.num96,
                      image: Assets.images.imgMe.provider(),
                    ),
                    ColumnTextProfile(
                        textChangeable: '54',
                        text: MyStrings.postsUserProfile,
                        textTheme: textTheme),
                    ColumnTextProfile(
                        textChangeable: '834',
                        text: MyStrings.followersUserProfile,
                        textTheme: textTheme),
                    ColumnTextProfile(
                        textChangeable: '162',
                        text: MyStrings.followingUserProfile,
                        textTheme: textTheme),
                  ],
                ),
                const SizedBox(height: MyDimens.num12),
                BioUserProfile(
                    mainText: "acob west",
                    secondText: 'Digital goodies designer ',
                    clickableText: '@pixsellz',
                    thirdText: "Everything is designed",
                    textTheme: textTheme),
              ],
            ),
          ),
        ),
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
                recognizer: TapGestureRecognizer()..onTap = () {},
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
class ColumnTextProfile extends StatelessWidget {
  const ColumnTextProfile({
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

//Custom widget - Items Oval profile page highlight
class ItemOval extends StatelessWidget {
  final double width;
  final double height;
  final double sizeInner;
  final double sizeOuter;
  final ImageProvider<Object> image;

  ItemOval({
    Key? key,
    required this.width,
    required this.height,
    required this.sizeInner,
    required this.sizeOuter,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: MyColors.borderOvalProfileScreen),
        borderRadius: BorderRadius.all(
          Radius.elliptical(sizeOuter, sizeOuter),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius:
              BorderRadius.all(Radius.elliptical(sizeInner, sizeInner)),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image(image: image),
          ),
        ),
      ),
    );
  }
}
