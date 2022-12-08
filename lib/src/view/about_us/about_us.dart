import 'package:flutter/material.dart';
import '../../widget/other/app_bar.dart';
import '../../widget/other/custom_back.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          size: MediaQuery.of(context).size,
          text: "About Us",
          centerTitleValue: true,
          leading: Row(
            children: const [
              CustomBack(),
            ],
          ),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("NAME : Encode Work System"),
            Text("NUMBER : 9727294921"),
            Text("MAIL : info@encodework.com"),
            Text("WEBSITE : http://www.encodework.com"),
            Linkify(
              text: "http://www.encodework.com",
              options: LinkifyOptions(humanize: true),
            ),
            SelectableLinkify(
              text: "http://www.encodework.com",
            ),
          ],
        ),
      ),
    );
  }
}
