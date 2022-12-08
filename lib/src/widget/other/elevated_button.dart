import 'package:flutter/material.dart';

typedef ContainerOnTap = Function()?;

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final double buttonHeight;
  final double buttonWidth;
  final ContainerOnTap? containerOnTap;

  const CustomElevatedButton(
      {Key? key,
      required this.text,
      required this.buttonColor,
      required this.buttonHeight,
      required this.buttonWidth,
      this.containerOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
          onPressed: containerOnTap,
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
