import 'package:flutter/material.dart';
import '../../../utilities/color/color_utils.dart';
import '../../../utilities/font/font_utils.dart';

typedef ContainerOnTap = Function()?;
// typedef Actions = Function()?;
// typedef Leading = Function()?;
// final bool centerTitleValue = false;

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final ContainerOnTap? containerOnTap;
  final dynamic actions;
  final dynamic leading;
  final String? text;
  final Size? size;
  final bool? centerTitleValue;

  const CustomAppBar({
    Key? key,
    this.text,
    this.containerOnTap,
    this.actions,
    this.leading,
    this.size,
    this.centerTitleValue = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: size!,
      child: SizedBox(
        height: 56,
        child: AppBar(
          title: Text(
            text!,
            // style: const TextStyle(
            //   fontSize: 22,
            //   color: Color(0xff2F3A4B),
            // ),
            style: FontUtils.h18(
              fontColor: ColorUtils.themeColor.oxff000000,
              fontWeight: FWT.semiBold,
            ),
          ),
          centerTitle: centerTitleValue,
          actions: actions,
          leading: leading,
          leadingWidth: 100,
          backgroundColor: const Color(0xffd3e8c9),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => size!;
}
