import 'package:flutter/material.dart';
import 'package:tec/extensions/space_xy_extension.dart';
import 'package:tec/res/colors.dart';
import 'package:tec/res/styles.dart';
import 'package:tec/widgets/account.dart';
import 'package:tec/widgets/comment_widget_notification.dart';
import 'package:tec/widgets/custom_tabbar_widget.dart';
import 'package:tec/widgets/follow_widget_notification.dart';
import 'package:tec/widgets/like_counter_notification.dart';
import 'package:tec/widgets/multi_like_notification.dart';

import '../../gen/assets.gen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TabController tabController = TabController(length: 2, vsync: this);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(controller: tabController, children: [
              CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(children: [
                        58.0.spaceY,
                        LikeCounterNotification(
                            imageprofiles: Image.asset(Assets.images.oval.path),
                            imgpostlist: [
                              Image.asset(Assets.images.rectangle1.path),
                              Image.asset(Assets.images.rectangle2.path),
                              Image.asset(Assets.images.rectangle3.path),
                            ],
                            accountname: accountname[0]),
                        MultiLikeNotification(
                            firstimageProfile:
                                Image.asset(Assets.images.zackjohn.path),
                            secondimageProfile:
                                Image.asset(Assets.images.kieronD.path),
                            accountname: [accountname[1], accountname[2]],
                            imagePost:
                                Image.asset(Assets.images.rectangle4.path),
                            likeCount: 3),
                        FollowWigetNotification(
                            imageprofiles:
                                Image.asset(Assets.images.kieronD.path),
                            followeraccountname: accountname[1],
                            accountname: accountname[3]),
                        LikeCounterNotification(
                            imageprofiles:
                                Image.asset(Assets.images.craigLove.path),
                            imgpostlist: [
                              Image.asset(Assets.images.rectangle5.path),
                              Image.asset(Assets.images.rectangle6.path),
                              Image.asset(Assets.images.rectangle7.path),
                              Image.asset(Assets.images.rectangle8.path),
                              Image.asset(Assets.images.rectangle9.path),
                              Image.asset(Assets.images.rectangle10.path),
                              Image.asset(Assets.images.rectangle11.path),
                              Image.asset(Assets.images.rectangle13.path),
                            ],
                            accountname: accountname[3]),
                        MultiLikeNotification(
                            firstimageProfile:
                                Image.asset(Assets.images.zackjohn.path),
                            secondimageProfile:
                                Image.asset(Assets.images.kieronD.path),
                            accountname: [accountname[1], accountname[2]],
                            imagePost:
                                Image.asset(Assets.images.rectangle14.path),
                            likeCount: 3),
                        MultiLikeNotification(
                            firstimageProfile:
                                Image.asset(Assets.images.zackjohn.path),
                            secondimageProfile:
                                Image.asset(Assets.images.kieronD.path),
                            accountname: [accountname[1], accountname[2]],
                            imagePost:
                                Image.asset(Assets.images.rectangle15.path),
                            likeCount: 3),
                        CommentWidgetNotification(
                            imgpostlist: Image.asset(Assets.images.oval.path),
                            imageprofiles:
                                Image.asset(Assets.images.rectangle10.path),
                            followeraccountname: accountname[0],
                            accountname: accountname[1],
                            commentedUserStory: true)
                      ])),
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Expanded(
                      child: Column(children: [
                        65.0.spaceY,
                        SizedBox(
                          height: size.height / 30,
                          width: size.width / 1.13,
                          child: Text(
                            "Follow Requests",
                            textAlign: TextAlign.left,
                            style: MyStyles.getRegularStyle(
                                color: MyColors.textnotificationcolor,
                                fontSize: 15),
                          ),
                        ),
                        Divider(color: MyColors.dividernotificationcolor),
                        SizedBox(
                          height: size.height / 26,
                          width: size.width / 1.13,
                          child: Text("New",
                              textAlign: TextAlign.left,
                              style: MyStyles.getBoldStyle(
                                  color: MyColors.textnotificationcolor,
                                  fontSize: 15)),
                        ),
                        LikeCounterNotification(
                            imgpostlist: [
                              Image.asset(Assets.images.rectangle1.path),
                            ],
                            imageprofiles: imageProfiles[0],
                            accountname: accountname[0]),
                        Divider(color: MyColors.dividernotificationcolor),
                        SizedBox(
                          height: size.height / 26,
                          width: size.width / 1.13,
                          child: Text("Today",
                              textAlign: TextAlign.left,
                              style: MyStyles.getBoldStyle(
                                  color: MyColors.textnotificationcolor,
                                  fontSize: 15)),
                        ),
                        MultiLikeNotification(
                            firstimageProfile: imageProfiles[1],
                            secondimageProfile: imageProfiles[2],
                            accountname: [accountname[1], accountname[2]],
                            imagePost: imagePost,
                            likeCount: 5),
                        Divider(color: MyColors.dividernotificationcolor),
                        SizedBox(
                          height: size.height / 26,
                          width: size.width / 1.13,
                          child: Text("This Week",
                              textAlign: TextAlign.left,
                              style: MyStyles.getBoldStyle(
                                  color: MyColors.textnotificationcolor,
                                  fontSize: 15)),
                        ),
                        CommentWidgetNotification(
                            imgpostlist:
                                Image.asset(Assets.images.craigLove.path),
                            imageprofiles:
                                Image.asset(Assets.images.rectangle20.path),
                            followeraccountname: accountname[3],
                            accountname: accountname[5],
                            commentedUserStory: false),
                        FollowWigetNotification(
                            imageprofiles:
                                Image.asset(Assets.images.martiniRound.path),
                            followeraccountname: accountname[4],
                            accountname: accountname[1]),
                        FollowWigetNotification(
                            imageprofiles:
                                Image.asset(Assets.images.maxjacobson.path),
                            followeraccountname: accountname[5],
                            accountname: accountname[1]),
                        FollowWigetNotification(
                            imageprofiles:
                                Image.asset(Assets.images.misPotter.path),
                            followeraccountname: accountname[6],
                            accountname: accountname[1]),
                        Divider(color: MyColors.dividernotificationcolor),
                        SizedBox(
                          height: size.height / 26,
                          width: size.width / 1.13,
                          child: Text("This Week",
                              textAlign: TextAlign.left,
                              style: MyStyles.getBoldStyle(
                                  color: MyColors.textnotificationcolor,
                                  fontSize: 15)),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ]),
            buildTabBarWidget(tabController),
          ],
        ),
      ),
    );
  }

  Widget buildTabBarWidget(TabController tabController) {
    return CustomTabBarWidget(
      items: const [
        Tab(
          text: 'Following',
        ),
        Tab(
          text: 'You',
        ),
      ],
      isBottom: false,
      tabController: tabController,
    );
  }
}
