import 'package:flutter/material.dart';
import '../../src/view/about_us/about_us.dart';
import '../../src/view/category/CategoryClass.dart';
import '../../src/view/category/category_detail_scrren.dart';
import '../../src/view/choose_language/choose_language_screen.dart';
import '../../src/view/contact_us/contact_us.dart';
import '../../src/view/detail_screen/detail_screen.dart';
import '../../src/view/favorite_facts/favorite_facts.dart';
import '../../src/view/home_screen/home_screen.dart';
import '../../src/view/intro_screen/intro_screen.dart';
import '../../src/view/login_screen/login_screen.dart';
import '../../src/view/notifications/notification_screen.dart';
import '../../src/view/privacy_policy/privacy_policy.dart';
import '../../src/view/setting_screen/setting_screen.dart';
import '../../src/view/splash_screen/splash_screen.dart';

class RoutesUtils {
  static const String initialRoute = '/';
  static const String splashScreen = '/SplashScreen';
  static const String introScreen = '/IntroScreen';
  static const String languageScreen = '/LanguageScreen';
  static const String homeScreen = '/HomeScreen';
  static const String settingScreen = '/SettingScreen';
  static const String notificationScreen = '/NotificationScreen';
  static const String favpriteFactsScreen = '/FavpriteFactsScreen';
  static const String privacyPolicyScreen = '/PrivacyPolicyScreen';
  static const String detailScreen = '/DetailScreen';
  static const String categoryScreen = '/CategoryScreen';
  static const String aboutUs = '/AboutUs';
  static const String contactUs = '/ContactUs';
  static const String loginScreen = '/LoginScreen';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });
      case introScreen:
        return MaterialPageRoute(builder: (context) {
          return const IntroScreen();
        });
      case languageScreen:
        return MaterialPageRoute(builder: (context) {
          return const LanguageScreen();
        });
      case homeScreen:
        return MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        });
      case settingScreen:
        return MaterialPageRoute(builder: (context) {
          return const SettingScreen();
        });
      case notificationScreen:
        return MaterialPageRoute(builder: (context) {
          return const NotificationScreen();
        });
      case favpriteFactsScreen:
        return MaterialPageRoute(builder: (context) {
          return const FavpriteFactsScreen();
        });
      case privacyPolicyScreen:
        return MaterialPageRoute(builder: (context) {
          return const PrivacyPolicyScreen();
        });
      case loginScreen:
        return MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        });
      case detailScreen:
        var DetailsArgs = (settings.arguments is Detail
            ? settings.arguments
            : Detail(description: "", title: "", image: "", tag: []));
        return MaterialPageRoute(builder: (context) {
          return DetailScreen(
            detail: DetailsArgs as Detail,
          );
        });

      case categoryScreen:
        // var categorysArgs = (settings.arguments is Categorys
        //     ? settings.arguments
        //     : Categorys(selectedIndex: 0));
        var categorysArgs = (settings.arguments is Categorys
            ? settings.arguments
            : Categorys(names: "", categoryName: ""));

        return MaterialPageRoute(builder: (context) {
          return CategoryScreen(
            categorys: categorysArgs as Categorys,
            categoryName: categorysArgs,
          );
        });
      case aboutUs:
        return MaterialPageRoute(builder: (context) {
          return const AboutUs();
        });
      case contactUs:
        return MaterialPageRoute(builder: (context) {
          return const ContactUs();
        });
      default:
        return MaterialPageRoute(builder: (contexxt) {
          return const SplashScreen();
        });
    }
  }
}
