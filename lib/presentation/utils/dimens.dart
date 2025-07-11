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

  final double chuckNorrisIconSize;

  AppDimensions._(
    this.defaultPadding,
    this.chuckNorrisIconSize
  );
}

// TODO: Insert dimensions such as in Compose.
class _DefaultDimens implements AppDimensions {
  @override
  double get defaultPadding => 16.0;

  @override
  double get chuckNorrisIconSize => 100.0;
}

class _SmallSizeDimens implements AppDimensions {
  @override
  double get defaultPadding => 12.0;

  @override
  double get chuckNorrisIconSize => 100.0;
}
