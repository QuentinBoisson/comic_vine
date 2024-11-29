import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:comic_vine/assets/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.agentsOfShieldBackground).existsSync(), isTrue);
    expect(File(AppImages.agentsOfShieldMini).existsSync(), isTrue);
  });
}
