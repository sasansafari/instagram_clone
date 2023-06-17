import 'package:flutter/material.dart';
import 'package:tec/extensions/space_xy_extension.dart';
import 'package:tec/models/stories_data.dart';
import 'package:tec/widgets/main_app_bar.dart';
import 'package:tec/widgets/story_list.dart';

import '../../models/posts_model.dart';
import '../../widgets/posts_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MainAppBar(),
              StoryList(stories: StoriesDatabase.stories),
              PostsListView(postsData: PostsDatabase.posts),
              10.0.spaceY,
              const CircularProgressIndicator(),
              10.0.spaceY,
            ],
          ),
        ),
      ),
    );
  }
}
