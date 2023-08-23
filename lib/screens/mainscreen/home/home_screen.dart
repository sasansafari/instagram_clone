import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:tec/extensions/space_xy_extension.dart';
import 'package:tec/models/stories_data.dart';
import 'package:tec/widgets/main_app_bar.dart';
import 'package:tec/widgets/story_list.dart';
import '../../../data/repo/story_repo.dart';
import '../../../data/src/story_src.dart';
import '../../../models/posts_model.dart';
import '../../../widgets/posts_list_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Dio _dio = Dio();

  //final postRepo = PostRepo(src: PostDbSrc());
  final storyRepo = StoryRepo(
    src: StoryRemoteSrc(
      http: Dio(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    //postRepo.getPosts(0);

    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            flexibleSpace: MainAppBar(),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              StoryList(stories: StoriesDatabase.stories),
              PostsListView(postsData: PostsDatabase.posts),
              10.0.spaceY,
              const CircularProgressIndicator(),
              10.0.spaceY,
            ]),
          )
        ],
      )),
    );
  }
}
