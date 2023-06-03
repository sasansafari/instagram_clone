import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../models/stories_data.dart';

class UsersProfile extends StatelessWidget {
  const UsersProfile({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        children: [
          Stack(
            children: [
              if (story.hasStory) ...[
                if (story.isViewed) ...[
                  Container(
                    width: 65,
                    height: 65,
                    // margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: Colors.grey.shade300,
                      // const Color(0xFFDBDBDB),
                      // Colors.grey.shade400,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(1.5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      padding: const EdgeInsets.all(2.5),
                      child: ProfileImage(story: story),
                    ),
                  )
                ] else ...[
                  Container(
                    width: 65,
                    height: 65,
                    // margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                      child: ProfileImage(story: story),
                    ),
                  )
                ]
              ] else ...[
                Container(
                  width: 65,
                  height: 65,
                  // margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: Colors.transparent,
                    // const Color(0xFFDBDBDB),
                    // Colors.grey.shade400,
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    padding: const EdgeInsets.all(2.5),
                    child: ProfileImage(story: story),
                  ),
                ),
              ],
              Positioned(
                left: 0,
                // top: 0,
                right: 0,
                bottom: -1, // -5
                child: story.hasLive
                    ? Assets.icons.live.svg(height: 19, width: 29)
                    : const SizedBox(),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(story.name),
        ],
      ),
    );
  }
}

// class UserProfileBtmNavSelected extends StatelessWidget {
//   const UserProfileBtmNavSelected({
//     Key? key,
//     required this.story,
//   }) : super(key: key);

//   final StoryData story;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 27,
//       height: 27,
//       // margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(1000),
//           color: selectedIndex == BottomNavIndex.profileIndex
//               ? Colors.black
//               : Colors.transparent),
//       child: Container(
//         margin: const EdgeInsets.all(2),
//         child: ProfileImage(story: story),
//       ),
//     );
//   }
// }

// class UserProfileBtmNavNotSelected extends StatelessWidget {
//   const UserProfileBtmNavNotSelected({
//     Key? key,
//     required this.story,
//   }) : super(key: key);

//   final StoryData story;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 27,
//       height: 27,
//       // margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(1000),
//         color: Colors.transparent,
//       ),
//       child: Container(
//         margin: const EdgeInsets.all(2),
//         child: ProfileImage(story: story),
//       ),
//     );
//   }
// }

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: Image.asset(story.imageFileName));
  }
}