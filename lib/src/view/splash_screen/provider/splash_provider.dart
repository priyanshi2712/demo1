import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../../../../../utilities/routes/routes.dart';
import '../../../../utilities/api/local_cache_keys.dart';
import '../../../../utilities/api/shared_preferences.dart';

class SplashProvider extends ChangeNotifier {
  getRouts(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      final navigator = Navigator.of(context);

      String? isLogin = SharedPreferencesUtils.preferences!
              .getString(LocalCacheKeys.applicationUserLoginStateKey) ??
          "";
      print(isLogin);
      if (isLogin.isEmpty) {
        navigator.pushReplacementNamed(RoutesUtils.introScreen);
      }
      else if (isLogin == "IntroScreen") {
        navigator.pushReplacementNamed(RoutesUtils.homeScreen);
      }
      else if (isLogin == "LanguageScreen") {
        navigator.pushReplacementNamed(RoutesUtils.homeScreen);
      }
      else {
        navigator.pushReplacementNamed(RoutesUtils.homeScreen);
      }
    });
  }
}
