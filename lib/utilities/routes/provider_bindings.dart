import 'package:demo/src/view/choose_language/provider/language_provider.dart';
import 'package:demo/src/view/home_screen/home_provider/home_provider.dart';
import 'package:demo/src/view/notifications/notification_provider/notification_provider.dart';
import 'package:provider/provider.dart';
import '../../src/view/category/category_provide/category_provider.dart';
import '../../src/view/login_screen/login_provider/login_provider.dart';
import '../../src/view/splash_screen/provider/splash_provider.dart';

class ProviderBindings {
  static List<ChangeNotifierProvider> provider = [
    ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
    ChangeNotifierProvider<LanguageProvider>(create: (_) => LanguageProvider()),
    ChangeNotifierProvider<CategoryProvider>(create: (_) => CategoryProvider()),
    ChangeNotifierProvider<NotificationProvider>(
        create: (_) => NotificationProvider()),
    ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
  ];
}

// class BlockProvider {
  // BlocProvider(
  //   create: (_) => CounterCubit(),
  //   child: CounterPage(),
  // ),
// }
