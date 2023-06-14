import 'package:flutter/material.dart';
import 'package:tec/res/dimens.dart';

class HomeScreenLikes extends StatelessWidget {
  String profile_picture;
  String first_like;
  String other_likes;
  HomeScreenLikes({
    Key? key,
    required this.profile_picture,
    required this.first_like,
    required this.other_likes,
  }) : super(key: key);

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
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Liked by ',
                  style: TextStyle(fontSize: 13.0),
                ),
                TextSpan(
                  text: first_like,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: ' and ', style: TextStyle(fontSize: 13.0)),
                TextSpan(
                  text: '$other_likes others',
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
