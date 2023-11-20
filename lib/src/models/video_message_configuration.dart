import 'package:flutter/material.dart';

import '../../chatview.dart';

class VideoMessageConfiguration {
  /// Provides configuration of share button while image message is appeared.

  final StringCallback? onTap;

  /// Used for giving height of image message.
  final double? height;

  /// Used for giving width of image message.
  final double? width;

  /// Used for giving padding of image message.
  final EdgeInsetsGeometry? padding;

  /// Used for giving margin of image message.
  final EdgeInsetsGeometry? margin;

  /// Used for giving border radius of image message.
  final BorderRadius? borderRadius;

  const VideoMessageConfiguration({
    this.onTap,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.borderRadius,
  });
}
