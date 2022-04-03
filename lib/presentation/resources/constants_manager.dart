import 'package:marathon/controller/cach_helper.dart';

class AppConstants {
  static const int splashDelay = 3;

  static   String? token=CacheHelper.get(key: "token");
}
