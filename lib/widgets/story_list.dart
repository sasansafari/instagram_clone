import 'package:flutter/material.dart';
import 'package:tec/widgets/story.dart';
import '../models/stories_data.dart';

List<StoryData> sortStories() {
  List<StoryData> stories = StoriesDatabase.stories;

  List<StoryData> updatedStories = [];
  List<StoryData> liveStories = [];
  List<StoryData> viewedStories = [];

  for (var story in stories) {
    if (story.hasLive) {
      liveStories.add(story);
    } else if (story.isViewed) {
      viewedStories.add(story);
    } else {
      updatedStories.add(story);
    }
  }

  // Move items with hasLive to index 1
  updatedStories.insertAll(1, liveStories);

  // Move items with isViewed to the end of the list
  updatedStories.addAll(viewedStories);

  return updatedStories;
}

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
          itemCount: sortStories().length,
          itemBuilder: (context, index) {
            final story = sortStories()[index];
            return Story(story: story);
          }),
    );
  }
}


