import 'package:flutter/material.dart';

class HomeScreenCaption extends StatelessWidget {
  String profile_name;
  String short_caption;
  TextDirection text_direction;
  HomeScreenCaption({
    Key? key,
    required this.profile_name,
    required this.short_caption,
    required this.text_direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: profile_name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            TextSpan(
              text: ' $short_caption',
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
            )
          ],
        ),
        maxLines: 2,
        textDirection: text_direction,
      ),
    );
  }
}
