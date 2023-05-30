/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add_new.svg
  SvgGenImage get addNew => const SvgGenImage('assets/icons/add_new.svg');

  /// File path: assets/icons/add_story.svg
  SvgGenImage get addStory => const SvgGenImage('assets/icons/add_story.svg');

  /// File path: assets/icons/explore.svg
  SvgGenImage get explore => const SvgGenImage('assets/icons/explore.svg');

  /// File path: assets/icons/explore_selected.svg
  SvgGenImage get exploreSelected =>
      const SvgGenImage('assets/icons/explore_selected.svg');

  /// File path: assets/icons/grid_Icon_inSelected.svg
  SvgGenImage get gridIconInSelected =>
      const SvgGenImage('assets/icons/grid_Icon_inSelected.svg');

  /// File path: assets/icons/grid_Icon_selected.svg
  SvgGenImage get gridIconSelected =>
      const SvgGenImage('assets/icons/grid_Icon_selected.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/home_selected.svg
  SvgGenImage get homeSelected =>
      const SvgGenImage('assets/icons/home_selected.svg');

  /// File path: assets/icons/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/icons/menu.svg');

  /// File path: assets/icons/notify.svg
  SvgGenImage get notify => const SvgGenImage('assets/icons/notify.svg');

  /// File path: assets/icons/notify_selected.svg
  SvgGenImage get notifySelected =>
      const SvgGenImage('assets/icons/notify_selected.svg');

  /// File path: assets/icons/private_icon.svg
  SvgGenImage get privateIcon =>
      const SvgGenImage('assets/icons/private_icon.svg');

  /// File path: assets/icons/tags_icon_inSelected.svg
  SvgGenImage get tagsIconInSelected =>
      const SvgGenImage('assets/icons/tags_icon_inSelected.svg');

  /// File path: assets/icons/tags_icon_selected.svg
  SvgGenImage get tagsIconSelected =>
      const SvgGenImage('assets/icons/tags_icon_selected.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        addNew,
        addStory,
        explore,
        exploreSelected,
        gridIconInSelected,
        gridIconSelected,
        home,
        homeSelected,
        menu,
        notify,
        notifySelected,
        privateIcon,
        tagsIconInSelected,
        tagsIconSelected
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_me.jpg
  AssetGenImage get imgMe => const AssetGenImage('assets/images/img_me.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [imgMe];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,

      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
