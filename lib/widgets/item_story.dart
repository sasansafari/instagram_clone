//Customwidget-ItemStory
import'package:flutter/material.dart';
import'package:tec/res/styles.dart';

import'../../../../res/colors.dart';

class ItemStory extends StatelessWidget{
final double?width;
final double?height;
final EdgeInsetsGeometry?margin;
final double?sizeInner;
final double?sizeOuter;
final String?textItemStoryBox;
final ImageProvider<Object>?image;
final Widget?imageDiff;
final double?sizedBoxHeight;
final bool?visible;

const ItemStory({
Key?key,
this.width,
this.height,
this.margin,
this.sizeInner,
this.sizeOuter,
this.image,
this.imageDiff,
this.textItemStoryBox,
this.sizedBoxHeight,
this.visible,
}):super(key:key);

@override
Widget build(BuildContext context){
  return Column(
    children:[
      Container(
        margin:margin!,
        width:width!,
        height:height!,
        decoration:BoxDecoration(
          border:
          Border.all(width:1.5,color:MyColors.borderStoryUPS),
          borderRadius:BorderRadius.all(
            Radius.elliptical(sizeOuter!,sizeOuter!),
          ),
        ),
        child:Padding(
          padding:const EdgeInsets.all(4.0),
          child:ClipRRect(
            borderRadius:
            BorderRadius.all(Radius.elliptical(sizeInner!,sizeInner!)),
            child:FittedBox(
              fit:BoxFit.cover,
              child:Image(image:image!),
            ),
          ),
        ),
      ),
      SizedBox(height:sizedBoxHeight!),
      Visibility(
        visible:visible!,
        child:Text(
          textItemStoryBox!,
          style:MyStyles.getSemiRegularTextStyleUPS(),
        ),
      ),
    ],
  );
}
}
