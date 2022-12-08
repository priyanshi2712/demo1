import 'package:flutter/material.dart';
import '../../../../utilities/asset/asset_utils.dart';
import 'app_bar.dart';

class CustomNotification extends StatelessWidget {
  final String text;
  final String time;
  const CustomNotification({
    Key? key,
    required this.text,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(text),
                  const Spacer(),
                  Image.asset(AssetUtils.close),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                      AssetUtils.clock,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(time),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
