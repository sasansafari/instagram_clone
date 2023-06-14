import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class CustomAssetWidget extends StatelessWidget {
  final AssetEntity assetEntity;
  final TextStyle? videoDurationTextStyle;
  const CustomAssetWidget(
      {Key? key, required this.assetEntity, this.videoDurationTextStyle,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: AssetEntityImage(
          assetEntity,
          isOriginal: false,
          thumbnailSize: const ThumbnailSize.square(250),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),),
        if (assetEntity.type == AssetType.video)
          const Positioned(
            bottom: 8,
            right: 8,
            child: Text(
              '04:54',
              style: TextStyle(color: Colors.white),
            ),
          )
      ],
    );
  }
}
