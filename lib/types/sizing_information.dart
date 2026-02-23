import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sizing_information.freezed.dart';

/// Holds responsive layout information: [ScreenType] and [Size].
///
/// Use with [LayoutBuilder] or [MediaQuery] to adapt UI to screen size.
/// [ScreenType.fromWidth] maps a width to [Small], [Medium], or [Large].
@freezed
abstract class SizingInformation with _$SizingInformation {
  const SizingInformation._();

  /// [screenType] and [screenSize] for the current layout context.
  const factory SizingInformation({
    required ScreenType screenType,
    required Size screenSize,
  }) = _SizingInformation;
}

// ignore_for_file: constant_identifier_names

/// Breakpoint-based screen size: [Small], [Medium], or [Large].
///
/// Use [fromWidth] to get the type for a given width.
enum ScreenType {
  Small(breakPointHigh: 670, breakPointLow: 0),
  Medium(breakPointHigh: 1500, breakPointLow: 670),
  Large(breakPointHigh: double.infinity, breakPointLow: 1500);

  const ScreenType({required this.breakPointHigh, required this.breakPointLow});

  final double breakPointLow;
  final double breakPointHigh;

  /// Returns [Small] for width ≤ 670, [Large] for width > 1500, [Medium] otherwise.
  static ScreenType fromWidth(double width) {
    if (width <= ScreenType.Small.breakPointHigh) {
      return ScreenType.Small;
    } else if (width > ScreenType.Medium.breakPointHigh) {
      return ScreenType.Large;
    } else {
      return ScreenType.Medium;
    }
  }
}
