import 'package:flutter/cupertino.dart';
import '../color/color_utils.dart';

enum FWT {
  bold,
  semiBold,
  medium,
  regular,
  light,
}

class FontUtils {
  static FontWeight getFontWeight(FWT fwt) {
    switch (fwt) {
      case FWT.light:
        return FontWeight.w200;
      case FWT.regular:
        return FontWeight.w400;
      case FWT.medium:
        return FontWeight.w500;
      case FWT.semiBold:
        return FontWeight.w600;
      case FWT.bold:
        return FontWeight.w700;
    }
  } static TextStyle h8({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 8,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h10({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 10,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h12({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 12,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h14({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 14,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h16({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 16,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h18({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 18,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h20({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 20,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h22({
    required Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 22,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h24({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 24,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h28({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 28,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h32({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 34,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h34({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 34,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h40({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 40,
      fontFamily: 'poppins',
    );
  }

  static TextStyle h48({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
  }) {
    return TextStyle(
      color: fontColor ?? ColorUtils.themeColor.oxff000000,
      fontWeight: getFontWeight(fontWeight),
      fontSize: 48,
      fontFamily: 'poppins',
    );
  }
}
