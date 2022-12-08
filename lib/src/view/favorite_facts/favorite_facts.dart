import 'package:flutter/material.dart';
import '../../widget/other/app_bar.dart';
import '../../widget/other/custom_back.dart';

class FavpriteFactsScreen extends StatefulWidget {
  const FavpriteFactsScreen({Key? key}) : super(key: key);

  @override
  State<FavpriteFactsScreen> createState() => _FavpriteFactsScreenState();
}

List favoriteFacts = [];

class _FavpriteFactsScreenState extends State<FavpriteFactsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          size: MediaQuery.of(context).size,
          text: "Favorite Facts",
          centerTitleValue: true,
          leading: Row(
            children: const [
              CustomBack(),
            ],
          ),
        ),
      ),
    );
  }
}
