import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/res/colors.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.secondaryColorUi,
        body: Center(
          child: Center(
            child: ItemOval(
              width: 96,
              height: 96,
              sizeInner: 86,
              sizeOuter: 96,
              image: Assets.images.imgMe.provider(),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemOval extends StatelessWidget {
  final double width;
  final double height;
  final double sizeInner;
  final double sizeOuter;
  final ImageProvider<Object> image;

    ItemOval({
    Key? key,
    required this.width,
    required this.height,
    required this.sizeInner,
    required this.sizeOuter,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: MyColors.borderOvalProfileScreen),
        borderRadius: BorderRadius.all(
          Radius.elliptical(sizeOuter, sizeOuter),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius:
              BorderRadius.all(Radius.elliptical(sizeInner, sizeInner)),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image(image: image),
          ),
        ),
      ),
    );
  }
}
