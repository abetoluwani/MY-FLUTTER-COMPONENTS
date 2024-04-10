import 'package:flutter/foundation.dart';

void appLog(dynamic data) {
  if (kDebugMode) {
    print('''
APP LOGER IS PRINTING ===========================================
YOUR DATA IS ----> $data \n
===============================================================
''');
  }
}
