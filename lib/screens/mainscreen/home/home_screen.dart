import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec/data/repo/post_repo.dart';
import 'package:tec/data/src/post_src.dart';
import 'package:tec/extensions/space_xy_extension.dart';
import 'package:tec/models/stories_data.dart';
import 'package:tec/screens/mainscreen/home/bloc/home_bloc.dart';
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


    return BlocProvider(
      create: (BuildContext context) {

          return HomeBloc(iPostRepo: iPostRepo, iStoryRepo: iStoryRepo);

        },
      child: SafeArea(
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
      ),
    );
  }
}
