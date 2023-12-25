import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../widgets/image_action_custom_widget.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class SelectedAssetWidget extends StatelessWidget {
  const SelectedAssetWidget({
    super.key,
    required this.selectedAsset,
    this.changeIsMultiple,
    required this.isMultiple,
  });

  final AssetEntity? selectedAsset;
  final Function()? changeIsMultiple;
  final bool isMultiple;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AssetEntityImage(
            selectedAsset!,
            isOriginal: false,
            thumbnailSize: const ThumbnailSize.square(250),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Center(
              child: Icon(
                Icons.error,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10.2,
          right: 10,
          child: Row(
            children: [
              ImageActionsCustomWidget(
                child: Assets.icons.boomerang.svg(fit: BoxFit.scaleDown),
              ),
              ImageActionsCustomWidget(
                child: Assets.icons.combinePhoto.svg(fit: BoxFit.scaleDown),
              ),
              ImageActionsCustomWidget(
                onTap: changeIsMultiple,
                width: 153,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Assets.icons.selectMultiple.svg(
                      fit: BoxFit.scaleDown,
                    ),
                    Text(
                      'SELECT MULTIPLE',
                      style: TextStyle(
                        color:
                            isMultiple == false ? Colors.white : Colors.white54,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
