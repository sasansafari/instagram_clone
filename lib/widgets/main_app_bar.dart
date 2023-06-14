import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../res/colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    
    // get size from device
    final screenSize = MediaQuery.of(context).size;
    // if device screen larger 1200 isLargScreen is true else isLargScreen is false

    final isLargeScreen = screenSize.width > 1200;
    return Container(
      padding: EdgeInsets.all(isLargeScreen ? 4 : 2),
      height: preferredSize.height,
      color: MyColors.bottomNavigationBar,
      child: Row(
        children: [
          IconButton(
            icon: Assets.icons.camera.svg(),
            onPressed: () {},
          ),
          SizedBox(
            // for logo center
            width: isLargeScreen ? 72 : 48,
          ),
          Expanded(
            child: Center(child: Assets.icons.instagramLogo.svg()),
          ),
          IconButton(
            icon: Assets.icons.igtv.svg(),
            onPressed: () {},
          ),
          IconButton(
            icon: Assets.icons.messanger.svg(),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
