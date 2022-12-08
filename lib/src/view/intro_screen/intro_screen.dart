import 'package:flutter/material.dart';
import '../../../../utilities/color/color_utils.dart';
import '../../../../utilities/routes/routes.dart';
import '../../../utilities/api/local_cache_keys.dart';
import '../../../utilities/api/shared_preferences.dart';
import '../../../utilities/asset/asset_utils.dart';
import '../../../utilities/font/font_utils.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();

    SharedPreferencesUtils.preferences!
        .setString(LocalCacheKeys.applicationUserStateKey, "IntroScreen");
    SharedPreferencesUtils.preferences!
        .setString(LocalCacheKeys.applicationUserLanguage, "English");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                AssetUtils.intro,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              // alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 10),
                // height: MediaQuery.of(context).size.height * 0.4,
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "“Knowledge is Currency Of 21st Century...”",
                      textAlign: TextAlign.center,
                      // style: TextStyle(
                      //   fontSize: 32,
                      //   color: Color(0xff2F3A4B),
                      // ),
                      style: FontUtils.h32(
                          fontColor: ColorUtils.themeColor.oxff2F3A4B,
                          fontWeight: FWT.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
                      textAlign: TextAlign.center,
                      // style: TextStyle(
                      //   fontSize: 14,
                      //   color: Color(0xff666666),
                      // ),
                      style: FontUtils.h14(
                        fontColor: ColorUtils.themeColor.oxff666666,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RoutesUtils.homeScreen);
                      },
                      child: Image.asset(AssetUtils.startButton),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
