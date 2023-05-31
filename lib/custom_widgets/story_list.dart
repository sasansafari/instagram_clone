import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../models/stories_data.dart';


class StoryList extends StatelessWidget {
  const StoryList({
    Key? key,
    required this.stories,
  }) : super(key: key);

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 90, //90
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return Story(story: story);
          }),
    );
  }
}

class Story extends StatelessWidget {
  const Story({
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
              story.isViewed
                  ? ProfileStoryViewed(story: story)
                  : ProfileStoryNotViewed(story: story),
              // Image.asset(Assets.images.stories.live.path),
              Positioned(
                left: 0,
                // top: 0,
                right: 0,
                bottom: -1, // -5
                child: story.isLive
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

class ProfileStoryNotViewed extends StatelessWidget {
  const ProfileStoryNotViewed({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class ProfileStoryViewed extends StatelessWidget {
  const ProfileStoryViewed({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class UserProfileBtmNavSelected extends StatelessWidget {
  const UserProfileBtmNavSelected({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 27,
      height: 27,
      // margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: Colors.black,
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        child: ProfileImage(story: story),
      ),
    );
  }
}

class UserProfileBtmNavNotSelected extends StatelessWidget {
  const UserProfileBtmNavNotSelected({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 27,
      height: 27,
      // margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: Colors.transparent,
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        child: ProfileImage(story: story),
      ),
    );
  }
}

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
