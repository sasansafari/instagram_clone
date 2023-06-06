import 'package:flutter/material.dart';
import 'package:tec/res/constant/colors.dart';
import 'package:tec/res/constant/dimens.dart';

//Custom widget - Item Story
class ItemStory extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final double? sizeInner;
  final double? sizeOuter;
  final TextTheme? textTheme;
  final String? textItemStoryBox;
  final ImageProvider<Object>? image;
  final Widget? imageDiff;
  final double? sizedBoxHeight;
  final bool? visible;

  ItemStory({
    Key? key,
    this.width,
    this.height,
    this.margin,
    this.sizeInner,
    this.sizeOuter,
    this.image,
    this.imageDiff,
    this.textTheme,
    this.textItemStoryBox,
    this.sizedBoxHeight,
    this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: margin!,
          width: width!,
          height: height!,
          decoration: BoxDecoration(
            border:
            Border.all(width: 1.5, color: MyColors.borderOvalProfileScreen),
            borderRadius: BorderRadius.all(
              Radius.elliptical(sizeOuter!, sizeOuter!),
            ),
          ),
          child: Padding(
            padding:  const EdgeInsets.all(MyDimens.num4),
            child: ClipRRect(
              borderRadius:
              BorderRadius.all(Radius.elliptical(sizeInner!, sizeInner!)),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image(image: image!),
              ),
            ),
          ),
        ),
        SizedBox(height: sizedBoxHeight!),
        Visibility(
          visible: visible!,
          child: Text(
            textItemStoryBox!,
            style: textTheme?.displaySmall,
          ),
        ),
      ],
    );
  }
}