import 'package:flutter/material.dart';
import 'package:tec/extensions/space_xy_extension.dart';
import 'package:tec/res/colors.dart';

import '../res/styles.dart';
import 'account.dart';

class CommentWidgetNotification extends StatefulWidget {
  CommentWidgetNotification(
      {required this.imgpostlist,
      required this.imageprofiles,
      required this.followeraccountname,
      required this.accountname,
      required this.commentedUserStory,
      Key? key})
      : super(key: key);

  String followeraccountname;
  Image imgpostlist;
  // mentioned user username
  Image imageprofiles;
  String accountname;
  bool commentedUserStory = false;

  @override
  State<CommentWidgetNotification> createState() => _CommentNotifWidgetState();
}

class _CommentNotifWidgetState extends State<CommentWidgetNotification> {
  bool isHeartEmpty = true;

  void StatusHear() {
    setState(() {
      isHeartEmpty = !isHeartEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      width: MediaQuery.of(context).size.width,
      height: size.height / 8,
      child: Column(
        children: [
          SizedBox(
            height: size.height / 12,
            width: size.width,
            child: Row(
              children: [
                // the user that commented image
                GestureDetector(
                  onTap: () {
                    if (widget.commentedUserStory == true) {
                      // show story
                    } else {
                      // Navigate to user profile Screen
                    }
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: widget.commentedUserStory == true
                              ? const LinearGradient(
                                  colors: [
                                    MyColors.purplestorycolor,
                                    MyColors.pinkstorycolor,
                                    MyColors.yelowstorycolor
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                )
                              : null,
                        ),
                        child: SizedBox(
                          child: widget.imgpostlist,
                          width: 44,
                          height: 44,
                        ),
                      ),
                    ],
                  ),
                ),
                10.0.spaceX,
                Flexible(
                  flex: 6,
                  child: SizedBox(
                    child: RichText(
                      maxLines: 2,
                      // softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: '${widget.followeraccountname}',
                            style: MyStyles.getBoldStyle(
                                color: MyColors.textnotificationcolor),
                          ),
                          TextSpan(
                            text: ' liked ${widget.accountname}’s comment: ',
                            style: MyStyles.getRegularStyle(
                                color: MyColors.textnotificationcolor),
                          ),
                          // userUsername
                          TextSpan(
                            text: '@${widget.accountname} ',
                            style: MyStyles.getRegularStyle(
                                color: MyColors.tagaccountcolor),
                          ),
                          TextSpan(
                            text: 'Nice!  ',
                            style: MyStyles.getRegularStyle(
                                color: MyColors.textnotificationcolor),
                          ),
                          TextSpan(
                            text: '${liketime()}h',
                            style: MyStyles.getRegularStyle(
                                color: MyColors.textgraynotificationcolor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                const Spacer(),
                SizedBox(height: 44, width: 44, child: widget.imageprofiles),
                6.0.spaceX
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: SizedBox(
              height: size.height / 25,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: StatusHear,
                    child: Icon(
                      isHeartEmpty ? Icons.favorite_border : Icons.favorite,
                      color: isHeartEmpty
                          ? MyColors.textgraynotificationcolor
                          : Colors.red,
                      size: 15,
                    ),
                  ),
                  15.0.spaceX,
                  Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Reply',
                    hintStyle: MyStyles.getRegularStyle(
                        color: MyColors.textgraynotificationcolor),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: size.height / 55),
                  ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
