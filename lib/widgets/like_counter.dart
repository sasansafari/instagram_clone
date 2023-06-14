import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tec/widgets/notification_textstyle.dart';

import 'account.dart';

class LikeCounter extends StatefulWidget {
  const LikeCounter({
    Key? key,
  }) : super(key: key);

  @override
  State<LikeCounter> createState() => _LikeCounterState();
}

class _LikeCounterState extends State<LikeCounter> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
        height: height / 5.5,
        width: width,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: 44,
              width: 44,
              child: Image.asset(accountlist[0].imgaccount)),
          SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${accountlist[0].nameaccount}',
                    style: NotificationTextStyle.textStylee(
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' liked ${imgpostlist.length} posts. '),
                  TextSpan(
                    text: '${_liketime()}h',
                    style: NotificationTextStyle.textStylee(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: imgpostlist.map((String imagePath) {
                return Container(
                  child: Image.asset(
                    imagePath,
                    width: 44,
                    height: 44,
                  ),
                );
              }).toList(),
            ),
          ])
        ]));
  }
}

String _liketime() {
  DateTime liketime = DateTime.now();

  return DateFormat('kk').format(liketime);
}
