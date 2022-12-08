import 'package:flutter/cupertino.dart';
import '../../../../utilities/asset/asset_utils.dart';

class CustomBack extends StatelessWidget {
  const CustomBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(5),
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Image.asset(
          AssetUtils.back,
          fit: BoxFit.cover,
          color: const Color(0xff2F3A4B),
        ),
      ),
    );
  }
}
