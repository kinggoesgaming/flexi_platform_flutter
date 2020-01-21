import 'package:flutter/foundation.dart' as flutter;
import 'package:flutter_test/flutter_test.dart';

import 'package:flexi_platform_flutter/flexi_platform_flutter.dart' as flexi;

void main() {
  test(
    "matches Flutter's TargetPlatform to Flexi's TargetPlatform",
    () {
      flexi.initializePlatform();
      expect(flutter.defaultTargetPlatform.toFlexiTargetPlatform(), flexi.defaultTargetPlatform);
    });
//   test('adds one to input values', () {
//     final calculator = Calculator();
//     expect(calculator.addOne(2), 3);
//     expect(calculator.addOne(-7), -6);
//     expect(calculator.addOne(0), 1);
//     expect(() => calculator.addOne(null), throwsNoSuchMethodError);
//   });
}
