import 'package:demo/utilities/api/shared_preferences.dart';
import 'package:demo/utilities/asset/color/theme_data/light_theme_data.dart';
import 'package:demo/utilities/color/color_utils.dart';
import 'package:demo/utilities/routes/provider_bindings.dart';
import 'package:demo/utilities/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils().initSharedPreference();
  ColorUtils.themeColor = LightTheme();
  runApp(const GyaanBook());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffd3e8c9),
      // systemNavigationBarDividerColor: Color(0xffd3e8c9),
      // systemNavigationBarColor: Color(0xffd3e8c9),
      systemNavigationBarColor: Colors.black,
    ),
  );
}

// This comment is for Testing purpose,

class GyaanBook extends StatelessWidget {
  const GyaanBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderBindings.provider,
      child: MaterialApp(
        // theme: ThemeData(canvasColor: Colors.amber),
        theme: ThemeData(fontFamily: "poppins"),
        onGenerateRoute: RoutesUtils.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesUtils.initialRoute,
      ),
    );
  }
}
