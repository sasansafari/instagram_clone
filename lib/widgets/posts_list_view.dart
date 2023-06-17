import 'package:flutter/material.dart';
import 'package:tec/widgets/home_screen_likes.dart';
import 'package:tec/widgets/posts.dart';
import 'package:tec/widgets/posts_bar.dart';

import '../models/posts_model.dart';
import 'custom_divider.dart';
import 'home_screen_short_caption.dart';

class PostsListView extends StatelessWidget {
  final List<PostsModel> postsData;
  const PostsListView({
    required this.postsData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: postsData.length,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostsBar(
            profilePic: postsData[index].profilePic,
            userName: postsData[index].userNameId,
            location: postsData[index].location,
          ),
          Posts(imagesUrl: postsData[index].imagesUrl),
          HomeScreenLikes(
            profile_picture: postsData[index].profilePic,
            first_like: postsData[index].firstLike,
            other_likes: postsData[index].otherLikes,
          ),
          HomeScreenCaption(
            profile_name: postsData[index].userNameId,
            short_caption: postsData[index].shortCaption,
            text_direction: TextDirection.ltr,
          ),
          const CustomDivider(),
        ],
      ),
    );
  }
}
