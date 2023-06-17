import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/extensions/space_xy_extension.dart';

import '../res/styles.dart';

class PostsBar extends StatelessWidget {
  final String profilePic;
  final String userName;
  final String location;
  const PostsBar({
    Key? key,
    required this.profilePic,
    required this.userName,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 11,
      ),
      width: double.infinity,
      height: 54,
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              profilePic,
            ),
          ),
          10.0.spaceX,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: MyStyles.getBoldStyle(color: Colors.black),
              ),
              Text(
                location,
                style: MyStyles.getRegularStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/more.svg'),
          ),
        ],
      ),
    );
  }
}
