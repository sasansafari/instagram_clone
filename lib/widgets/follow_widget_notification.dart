import 'package:flutter/material.dart';
import 'package:tec/extensions/space_xy_extension.dart';
import 'package:tec/res/colors.dart';
import 'package:tec/res/styles.dart';

import 'account.dart';

class FollowWigetNotification extends StatefulWidget {
  Image imageprofiles;
  String accountname;
  String followeraccountname;

  FollowWigetNotification({
    Key? key,
    required this.imageprofiles,
    required this.followeraccountname,
    required this.accountname,
  }) : super(key: key);

  @override
  State<FollowWigetNotification> createState() =>
      _FollowWigetNotificationState();
}

class _FollowWigetNotificationState extends State<FollowWigetNotification> {
  String buttonText = 'Follow';
  Color buttonColor = MyColors.btmfollowcolor;
  bool isFirstTap = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        height: size.height / 12,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        text: widget.followeraccountname,
                        style: MyStyles.getBoldStyle(
                            color: MyColors.textnotificationcolor,),),
                    TextSpan(
                        text: ' started following ',
                        style: MyStyles.getRegularStyle(
                            color: MyColors.textnotificationcolor,),),
                    TextSpan(
                        text: '${widget.accountname}. ',
                        style: MyStyles.getBoldStyle(
                            color: MyColors.textnotificationcolor,),),
                    TextSpan(
                      text: '${liketime()}h',
                      style: MyStyles.getRegularStyle(
                          color: MyColors.textgraynotificationcolor,),
                    ),
                  ],
                ),
              ),
            ],),
          ),
          const Spacer(),
          InkWell(
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
            },
            child: Center(
              child: Container(
                height: size.height / 25,
                width: size.width / 4,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        width: 1,
                        color: buttonColor == MyColors.btmfollowcolor
                            ? Colors.transparent
                            : MyColors.dividernotificationcolor,),),
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: isFirstTap ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],),
      ),
    );
  }
}
