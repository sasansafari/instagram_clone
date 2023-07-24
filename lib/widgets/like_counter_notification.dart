import 'package:flutter/material.dart';
import 'package:tec/extensions/space_xy_extension.dart';
import 'package:tec/res/colors.dart';
import 'package:tec/res/styles.dart';

import 'account.dart';

class LikeCounterNotification extends StatelessWidget {
  Image imageprofiles;
  String accountname;
  List<Image> imgpostlist;
  LikeCounterNotification(
      {Key? key,
      required this.imageprofiles,
      required this.imgpostlist,
      required this.accountname,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMoreThanTwoImages = imgpostlist.length > 2;

    if (isMoreThanTwoImages) {
      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SizedBox(
          height: imgpostlist.length > 5 ? size.height / 5 : size.height / 8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 44, width: 44, child: imageprofiles),
              10.0.spaceX,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.0.spaceY,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: accountname,
                          style: MyStyles.getBoldStyle(
                              color: MyColors.textnotificationcolor,),
                        ),
                        TextSpan(
                          text: ' liked ${imgpostlist.length} posts. ',
                          style: MyStyles.getRegularStyle(
                              color: MyColors.textnotificationcolor,),
                        ),
                        TextSpan(
                          text: '${liketime()}h',
                          style: MyStyles.getRegularStyle(
                              color: MyColors.textgraynotificationcolor,),
                        ),
                      ],
                    ),
                  ),
                  15.0.spaceY,
                  SizedBox(
                    width: size.width / 1.32,
                    height: size.height / 15,
                    child: Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: imgpostlist,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SizedBox(
          height: size.height / 17,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.0.spaceX,
              SizedBox(height: 44, width: 44, child: imageprofiles),
              10.0.spaceX,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.0.spaceY,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: accountname,
                          style: MyStyles.getBoldStyle(
                              color: MyColors.textnotificationcolor,),
                        ),
                        TextSpan(
                          text: ' liked ${imgpostlist.length} posts. ',
                          style: MyStyles.getRegularStyle(
                              color: MyColors.textnotificationcolor,),
                        ),
                        TextSpan(
                          text: '${liketime()}h',
                          style: MyStyles.getRegularStyle(
                              color: MyColors.textgraynotificationcolor,),
                        ),
                      ],
                    ),
                  ),
                ],
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
}
