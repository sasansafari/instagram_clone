import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../res/dimens.dart';
import 'drawer_item.dart';

class SpecialDrawer extends StatelessWidget {
  const SpecialDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const ListTile(
            title: Text('s.khasanov_'),
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.archive.svg(),
              title: 'Archive',
            ),
            onTap: () {},
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.yourActivity.svg(),
              title: 'Your Activity',
            ),
            onTap: () {},
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.nameTage.svg(),
              title: 'Nametag',
            ),
            onTap: () {},
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.saved.svg(),
              title: 'Saved',
            ),
            onTap: () {},
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.closeFreind.svg(),
              title: 'Close Friends',
            ),
            onTap: () {},
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.discover.svg(),
              title: 'Discover People',
            ),
            onTap: () {},
          ),
          ListTile(
            title: CustomDrawer(
              icon: Assets.icons.menu.facebook.svg(),
              title: 'Open Facebook',
            ),
            onTap: () {},
          ),const SizedBox(height: Dimens.large*8.7,)
          ,
          ListTile(
              title: CustomDrawer(
            icon: Assets.icons.menu.setting.svg(),
            title: 'Settings',
          ),onTap: () {
            
          },),
        ],
      ),
    );
  }
}