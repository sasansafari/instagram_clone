import 'package:flutter/material.dart';
import 'package:tec/extensions/space_xy_extension.dart';
import 'package:tec/res/colors.dart';
import 'package:tec/res/styles.dart';

import 'account.dart';

class NotificationFollowing extends StatefulWidget {
  Image imageprofiles;
  String accountname;
  String followeraccountname;

  NotificationFollowing(
      {Key? key,
      required this.imageprofiles,
      required this.followeraccountname,
      required this.accountname})
      : super(key: key);

  @override
  State<NotificationFollowing> createState() => _NotificationFollowingState();
}

class _NotificationFollowingState extends State<NotificationFollowing> {
  String buttonText = 'Follow';
  Color buttonColor = MyColors.btmfollowcolor;
  bool isFirstTap = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 12,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        16.0.spaceX,
        SizedBox(height: 44, width: 44, child: widget.imageprofiles),
        10.0.spaceX,
        SizedBox(
          width: size.width / 2,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            15.0.spaceY,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '${widget.followeraccountname}',
                      style: MyStyles.getBoldStyle(
                          color: MyColors.textnotificationcolor)),
                  TextSpan(
                      text: ' started following ',
                      style: MyStyles.getRegularStyle(
                          color: MyColors.textnotificationcolor)),
                  TextSpan(
                      text: '${widget.accountname}. ',
                      style: MyStyles.getBoldStyle(
                          color: MyColors.textnotificationcolor)),
                  TextSpan(
                    text: '${liketime()}h',
                    style: MyStyles.getRegularStyle(
                        color: MyColors.textgraynotificationcolor),
                  ),
                ],
              ),
            ),
          ]),
        ),
        6.0.spaceX,
        InkWell(
            child: Center(
                child: Container(
              height: size.height / 23,
              width: size.width / 4,
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      width: 1,
                      color: buttonColor == MyColors.btmfollowcolor
                          ? Colors.transparent
                          : MyColors.dividernotificationcolor)),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: isFirstTap ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            )),
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                if (isFirstTap) {
                  setState(() {
                    buttonText = 'Message';
                    buttonColor = Colors.white;
                  });
                  isFirstTap = false;
                } else {
                  //open direct page
                }
              });
            })
      ]),
    );
  }
}
