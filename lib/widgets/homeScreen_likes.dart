import 'package:flutter/material.dart';
import 'package:tec/res/dimens.dart';

class HomeScreenLikes extends StatelessWidget {
  String profile_picture;
  List likes;
  HomeScreenLikes(
      {Key? key, required this.profile_picture, required this.likes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.normal),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(profile_picture),
            radius: 10.0,
          ),
          const SizedBox(width: Dimens.small),
          const Text("Liked by ", style: TextStyle(fontSize: 13.0)),
          Text(likes.first,
              style:
                  const TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold)),
          const Text(" and ", style: TextStyle(fontSize: 13.0)),
          Text(
            "${likes.length - 1}" + " others",
            style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
