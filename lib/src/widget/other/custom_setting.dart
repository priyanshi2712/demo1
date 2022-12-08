import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef CustomOnTap = Function()?;

class CustomSetting extends StatelessWidget {
  final String text;
  final String image;
  final String trailingIcon;
  final CustomOnTap customOnTap;

  const CustomSetting({
    Key? key,
    required this.text,
    required this.image,
    required this.trailingIcon,
    required this.customOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: customOnTap,
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.all(6),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            // Image.asset(image),
            Container(
              padding: const EdgeInsets.all(6),
              height: 37,
              width: 37,
              decoration: BoxDecoration(
                // color: Color(0xff8CC270),
                color: const Color(0xffC6E0B8),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(
                  color: const Color(0xff8CC270),
                  width: 1.5,
                ),
              ),
              child: SvgPicture.asset(image),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Image.asset(trailingIcon),
          ]),
        ),
      ),
    );
  }
}
