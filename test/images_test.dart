import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:matrix/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.vector).existsSync(), isTrue);
    expect(File(Images.account).existsSync(), isTrue);
    expect(File(Images.addCircle).existsSync(), isTrue);
    expect(File(Images.crossClose).existsSync(), isTrue);
    expect(File(Images.home).existsSync(), isTrue);
    expect(File(Images.iconGoogle).existsSync(), isTrue);
    expect(File(Images.matrixLogo).existsSync(), isTrue);
    expect(File(Images.notification).existsSync(), isTrue);
    expect(File(Images.picture).existsSync(), isTrue);
    expect(File(Images.search).existsSync(), isTrue);
    expect(File(Images.tickCircleLinear).existsSync(), isTrue);
  });
}
