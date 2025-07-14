import 'package:fimber_io/fimber_io.dart';
import 'package:flutter/material.dart';

class Dimens {
  static const double _screenWidthSmallSize = 360.0;

  static AppDimensions getAppDimens(BuildContext context) {
    double screenWidthSize = MediaQuery.of(context).size.width;

    if (screenWidthSize <= _screenWidthSmallSize) {
      Fimber.d("$screenWidthSize");
      return _SmallSizeDimens();
    }

    return _DefaultDimens();
  }
}

abstract class AppDimensions {
  final double defaultPadding;

  final double size12;
  final double size16;

  final double chuckNorrisIconSize;
  final double cardElevation;
  final double cardRadius;

  AppDimensions._(
    this.defaultPadding,
    this.size12,
    this.size16,
    this.chuckNorrisIconSize,
    this.cardElevation,
    this.cardRadius
  );
}

class _DefaultDimens implements AppDimensions {
  @override
  double get defaultPadding => 16.0;

  @override
  double get size12 => 12.0;

  @override
  double get size16 => 16.0;

  @override
  double get chuckNorrisIconSize => 100.0;

  @override
  double get cardElevation => 4.0;

  @override
  double get cardRadius => 16.0;
}

class _SmallSizeDimens implements AppDimensions {
  @override
  double get defaultPadding => 12.0;

  @override
  double get size12 => 9.0;

  @override
  double get size16 => 12.0;

  @override
  double get chuckNorrisIconSize => 100.0;


  @override
  double get cardElevation => 4.0;

  @override
  double get cardRadius => 16.0;
}
