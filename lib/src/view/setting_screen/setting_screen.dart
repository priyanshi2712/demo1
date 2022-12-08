import 'package:flutter/material.dart';
import '../../../../utilities/asset/asset_utils.dart';
import '../../../utilities/routes/routes.dart';
import '../../widget/other/app_bar.dart';
import '../../widget/other/custom_back.dart';
import '../../widget/other/custom_setting.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          size: MediaQuery.of(context).size,
          text: "Setting",
          centerTitleValue: true,
          leading: Row(
            children: const [
              CustomBack(),
            ],
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(bottom: 20, top: 20, left: 10, right: 10),
          child: Column(
            children: [
              CustomSetting(
                text: "Languages",
                image: AssetUtils.languages,
                trailingIcon: AssetUtils.next,
                customOnTap: () {
                  Navigator.of(context).pushNamed(RoutesUtils.languageScreen);
                },
              ),
              CustomSetting(
                text: "Notifications",
                image: AssetUtils.notifications,
                trailingIcon: AssetUtils.next,
                customOnTap: () {
                  Navigator.of(context)
                      .pushNamed(RoutesUtils.notificationScreen);
                },
              ),
              CustomSetting(
                text: "Favorite",
                image: AssetUtils.favorite,
                trailingIcon: AssetUtils.next,
                customOnTap: () {
                  Navigator.of(context)
                      .pushNamed(RoutesUtils.favpriteFactsScreen);
                },
              ),
              CustomSetting(
                text: "Privacy Policy",
                image: AssetUtils.privacyPolicy,
                trailingIcon: AssetUtils.next,
                customOnTap: () {
                  Navigator.of(context)
                      .pushNamed(RoutesUtils.privacyPolicyScreen);
                },
              ),
              CustomSetting(
                text: "About us",
                image: AssetUtils.aboutUs,
                trailingIcon: AssetUtils.next,
                customOnTap: () {
                  Navigator.of(context).pushNamed(RoutesUtils.aboutUs);
                },
              ),
              CustomSetting(
                text: "Contact us",
                image: AssetUtils.contactUs,
                trailingIcon: AssetUtils.next,
                customOnTap: () {
                  Navigator.of(context).pushNamed(RoutesUtils.contactUs);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
