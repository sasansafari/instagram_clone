import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';
import '../models/stories_data.dart';
import '../screens/mainscreen/main_screen.dart';

final myUserProfile = StoriesDatabase.stories[0];

class Story extends StatelessWidget {
  const Story({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    // User object Container with text
    if (story.hasStory) {
      return Container(
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          children: [
            Stack(
              children: [
                if (!story.isViewed) ...[
                  // User has story and not viewed
                  storyNotViewed()
                ] else ...[
                  // User has story and story is viewed
                  storyViewed()
                ],
                if (story.hasLive) ...[
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -1,
                    child: Assets.icons.live.svg(height: 19, width: 29),
                  ),
                ]
              ],
            ),
            const SizedBox(height: 8),
            if (story.hasStory) ...[Text(story.name)]
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget withoutStory() {
    return Container(
      margin: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1000),
      ),
      padding: const EdgeInsets.all(2.5),
      child: profileImage(story),
    );
  }

  Widget storyNotViewed() {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xFFD91A46),
            Color(0xFFFBAA47),
            Color(0xFFA60F93),
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1000),
        ),
        padding: const EdgeInsets.all(2.5),
        child: profileImage(story),
      ),
    );
  }

  Widget storyViewed() {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: Colors.grey.shade300,
      ),
      child: Container(
        margin: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1000),
        ),
        padding: const EdgeInsets.all(2.5),
        child: profileImage(story),
      ),
    );
  }
}

Widget profileImage(userProfile) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(1000),
      child: Image.asset(userProfile.imageFileName));
}

Widget userProfileBtmNav() {
  return Container(
    width: 27,
    height: 27,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: selectedIndex == BottomNavIndex.profileIndex
            ? Colors.black
            : Colors.transparent),
    child: Container(
      margin: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Container(
        margin: const EdgeInsets.all(1.5),
        child: profileImage(myUserProfile),
      ),
    ),
  );
}
