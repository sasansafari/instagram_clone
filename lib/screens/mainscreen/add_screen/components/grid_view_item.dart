import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../widgets/custom_asset_widget.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
    required this.assetEntity,
    required this.isMultiple,
    required this.multipleSelectedAsset,
    this.onTap,
  });

  final AssetEntity assetEntity;
  final bool isMultiple;
  final List<AssetEntity> multipleSelectedAsset;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomAssetWidget(
              assetEntity: assetEntity,
            ),
          ),
          Positioned(
            right: 6,
            top: 6,
            child: isMultiple == true
                ? Container(
                    alignment: Alignment.center,
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: multipleSelectedAsset.contains(assetEntity)
                          ? Colors.blue
                          : null,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    child: multipleSelectedAsset.contains(assetEntity)
                        ? Text(
                            '${multipleSelectedAsset.indexOf(assetEntity) + 1}',
                          )
                        : null,
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
