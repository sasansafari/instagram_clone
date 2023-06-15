import 'package:flutter/material.dart';
import 'package:tec/widgets/custom_tabbar_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 2, vsync: this);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
              controller: tabController,
              children: const [
                Center(child: Text('Following')),
                Center(child: Text('You')),
              ],
            ),
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
