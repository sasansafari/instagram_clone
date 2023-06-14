import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class CustomAssetWidget extends StatelessWidget {
  final AssetEntity assetEntity;
  final TextStyle? videoDurationTextStyle;
  const CustomAssetWidget({
    Key? key,
    required this.assetEntity,
    this.videoDurationTextStyle,
  }) : super(key: key);

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
          ),
        ),
        if (assetEntity.type == AssetType.video)
          Positioned(
            bottom: 8,
            right: 8,
            child: Text(
              assetEntity.videoDuration.toMinutesSeconds(),
              style: const TextStyle(color: Colors.white),
            ),
          )
      ],
    );
  }
}

extension DurationExtensions on Duration {
  String toMinutesSeconds() {
    String twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = _toTwoDigits(inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  String _toTwoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }
}
