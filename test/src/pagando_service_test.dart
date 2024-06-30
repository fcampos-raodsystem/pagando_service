// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:paying_service/service.dart';

void main() {
  group('PagandoService', () {
    test('can be instantiated', () async {
      expect(
        RestService(appBaseUrl: '', appBaseDevUrl: '', isDev: true),
        isNotNull,
      );
    });
  });
}
