import 'package:flutter/material.dart';
import 'package:tec/extensions/space_xy_extension.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/res/colors.dart';
import 'package:tec/res/styles.dart';

import 'account.dart';

class MultiLike extends StatelessWidget {
  const MultiLike({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    List<Image> imageProfiles = [
      Assets.icons.userMultiLike1.image(width: 50, height: 50),
      Assets.icons.userMultiLike1.image(width: 50, height: 50)
    ];
    List<String> textProlfilesName = ['Hossein_110', 'ali'];
    Image imagePost = Assets.icons.imagePostMultiLike.image();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: MultiLikeNotification(
        firstimageProfile: imageProfiles[0],
        secondimageProfile: imageProfiles[2],
        accountname: textProlfilesName,
        imagePost: imagePost,
        likeCount: 50,
      ),),
    );
  }
}

class MultiLikeNotification extends StatelessWidget {
  Image firstimageProfile;
  Image secondimageProfile;
  List<String> accountname;
  Image imagePost;
  int likeCount;

  MultiLikeNotification(
      {Key? key,
      required this.firstimageProfile,
      required this.secondimageProfile,
      required this.accountname,
      required this.imagePost,
      required this.likeCount,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        height: size.height / 10,
        child: Row(
          children: [
            // 16.0.spaceX,
            SizedBox(
              width: 44,
              height: 44,
              child: Stack(
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: firstimageProfile,
                    ),
                  ),
                  Positioned(
                      height: 32,
                      width: 32,
                      left: 11,
                      top: 11,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: secondimageProfile,
                      ),),
                ],
              ),
            ),
            10.0.spaceX,
            SizedBox(
              width: size.width / 1.6,
              height: size.height / 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 6,
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                          text: accountname.join(','),
                          style: MyStyles.getBoldStyle(
                              color: MyColors.textnotificationcolor,),
                          children: [
                            TextSpan(
                                text: ' and ',
                                style: MyStyles.getRegularStyle(
                                    color: MyColors.textnotificationcolor,),),
                            TextSpan(
                              text: '${likeCount.toString()} others ',
                              style: MyStyles.getBoldStyle(
                                  color: MyColors.textnotificationcolor,),
                            ),
                            TextSpan(
                                text: 'Liked your photo. ',
                                style: MyStyles.getRegularStyle(
                                    color: MyColors.textnotificationcolor,),
                                children: [
                                  TextSpan(
                                    text: '${liketime()}h',
                                    style: MyStyles.getRegularStyle(
                                        color:
                                            MyColors.textgraynotificationcolor,),
                                  ),
                                ],),
                          ],),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 44,
              height: 44,
              child: imagePost,
            )
          ],
        ),
      ),
    );
  }
}
