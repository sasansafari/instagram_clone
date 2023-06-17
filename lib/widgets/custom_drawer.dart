import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ListTile(
                title: Text('s.khasanov_'),
              ),
              ListTile(
                title: DrawerItem(
                  icon: Assets.icons.menu.archive.svg(),
                  title: 'Archive',
                ),
                onTap: () {},
              ),
              ListTile(
                title: DrawerItem(
                  icon: Assets.icons.menu.yourActivity.svg(),
                  title: 'Your Activity',
                ),
                onTap: () {},
              ),
              ListTile(
                title: DrawerItem(
                  icon: Assets.icons.menu.nameTag.svg(),
                  title: 'Nametag',
                ),
                onTap: () {},
              ),
              ListTile(
                title: DrawerItem(
                  icon: Assets.icons.menu.saved.svg(),
                  title: 'Saved',
                ),
                onTap: () {},
              ),
              ListTile(
                title: DrawerItem(
                  icon: Assets.icons.menu.closeFreinds.svg(),
                  title: 'Close Friends',
                ),
                onTap: () {},
              ),
              ListTile(
                title: DrawerItem(
                  icon: Assets.icons.menu.discoverPeople.svg(),
                  title: 'Discover People',
                ),
                onTap: () {},
              ),
              ListTile(
                title: DrawerItem(
                  icon: Assets.icons.menu.openFacebook.svg(),
                  title: 'Open Facebook',
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        ListTile(
          title: DrawerItem(
            icon: Assets.icons.menu.setting.svg(),
            title: 'Settings',
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
