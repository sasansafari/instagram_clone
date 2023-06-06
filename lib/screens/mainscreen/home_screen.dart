import 'package:flutter/material.dart';
import '../../widgets/story_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final stories = StoriesDatabase.stories;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(elevation: 0.8, backgroundColor: Colors.white),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              StoryList(stories: sortStories()),
              const Divider(
                color: Colors.black38,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
