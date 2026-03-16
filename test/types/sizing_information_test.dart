import 'package:convenience_types/types/sizing_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ScreenType', () {
    group('fromWidth', () {
      test('It should return Small for width <= 670', () {
        expect(ScreenType.fromWidth(0), ScreenType.Small);
        expect(ScreenType.fromWidth(320), ScreenType.Small);
        expect(ScreenType.fromWidth(670), ScreenType.Small);
      });

      test('It should return Medium for width > 670 and <= 1500', () {
        expect(ScreenType.fromWidth(670.1), ScreenType.Medium);
        expect(ScreenType.fromWidth(1024), ScreenType.Medium);
        expect(ScreenType.fromWidth(1500), ScreenType.Medium);
      });

      test('It should return Large for width > 1500', () {
        expect(ScreenType.fromWidth(1500.1), ScreenType.Large);
        expect(ScreenType.fromWidth(1920), ScreenType.Large);
        expect(ScreenType.fromWidth(3840), ScreenType.Large);
      });
    });
  });

  group('SizingInformation', () {
    test('It should store screenType and screenSize', () {
      const size = Size(800, 600);
      const sizingInfo = SizingInformation(
        screenType: ScreenType.Medium,
        screenSize: size,
      );

      expect(sizingInfo.screenType, ScreenType.Medium);
      expect(sizingInfo.screenSize, size);
    });

    test('It should be equatable via freezed', () {
      const size = Size(800, 600);
      const info1 = SizingInformation(
        screenType: ScreenType.Medium,
        screenSize: size,
      );
      const info2 = SizingInformation(
        screenType: ScreenType.Medium,
        screenSize: size,
      );

      expect(info1, info2);
      expect(info1 == info2, true);
      expect(info1.hashCode, info2.hashCode);
    });
  });
}
