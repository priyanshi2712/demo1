import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../widget/other/app_bar.dart';
import '../../widget/other/custom_back.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
    // if (Platform.isAndroid) {
    //   WebView.platform = SurfaceAndroidWebView();
    // }

    const WebView(
      initialUrl: 'https://flutter.dev',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          size: MediaQuery.of(context).size,
          text: "Privacy Policy",
          centerTitleValue: true,
          leading: Row(
            children: const [
              CustomBack(),
            ],
          ),
        ),
        body: const WebView(
          initialUrl: 'http://192.168.0.121:8001/privacy-policy',
        ),
      ),
    );
  }
}
