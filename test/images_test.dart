import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:matrix/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.iconGoogle).existsSync(), isTrue);
    expect(File(Images.matrixLogo).existsSync(), isTrue);
  });
}
