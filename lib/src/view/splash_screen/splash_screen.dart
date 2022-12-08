import 'package:demo/src/view/splash_screen/provider/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utilities/api/local_cache_keys.dart';
import '../../../utilities/api/shared_preferences.dart';
import '../../../utilities/asset/asset_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _keyboardVisible = false;
  dynamic isRoute;
  dynamic firstTime;

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtils.preferences!.setString(
        LocalCacheKeys.applicationUserLoginStateKey, "LanguageScreen");
    final provider = Provider.of<SplashProvider>(context, listen: false);
    provider.getRouts(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Image.asset(AssetUtils.splashScreen),
          ]),
        ),
      ),
    );
  }
}
