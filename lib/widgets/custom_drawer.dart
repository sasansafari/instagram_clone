import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: MediaQuery.of(context).size.width * 0.67,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
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
      ),
    );
  }
}
