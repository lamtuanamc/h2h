import 'package:example_hack2hire/res/colors.dart';
import 'package:example_hack2hire/res/size.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle textBoldPrimary10 = TextStyle(
      fontSize: AppSize.fontSp10,
      height: 1.4,
      fontWeight: FontWeight.w700,
      color: AppColors.primary);

  static const TextStyle textBoldGray10 = TextStyle(
      fontSize: AppSize.fontSp10,
      height: 1.4,
      fontWeight: FontWeight.w700,
      color: AppColors.gray4);

  static const TextStyle textBoldWhite10 = TextStyle(
      fontSize: AppSize.fontSp10,
      height: 1.4,
      fontWeight: FontWeight.w700,
      color: Colors.white);

  static const TextStyle textBoldDark14 = TextStyle(
    fontSize: AppSize.fontSp14,
    height: 1.4,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(0, 0, 0, 0.65),
  );

  static const TextStyle textSizeGray12 = TextStyle(
      fontSize: AppSize.fontSp12, height: 1.5, color: AppColors.gray6);

  static const TextStyle textSize16 = TextStyle(
    fontSize: AppSize.fontSp16,
  );

  static const TextStyle textBold14 =
      TextStyle(fontSize: AppSize.fontSp14, fontWeight: FontWeight.bold);

  static const TextStyle textGray14 = TextStyle(
      fontSize: AppSize.fontSp14,
      height: 1.4,
      fontWeight: FontWeight.w400,
      color: AppColors.gray8);

  static const TextStyle textBoldPrimary14 = TextStyle(
      fontSize: AppSize.fontSp14,
      height: 1.4,
      fontWeight: FontWeight.w700,
      color: AppColors.primary);

  static const TextStyle textBold16 = TextStyle(
      fontSize: AppSize.fontSp16,
      height: 1.5,
      fontWeight: FontWeight.bold,
      color: AppColors.dark2);

  static const TextStyle textBold18 =
      TextStyle(fontSize: AppSize.fontSp18, fontWeight: FontWeight.bold);

  static const TextStyle textBold24 =
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);

  static const TextStyle textBold26 =
      TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold);

  static const TextStyle textBold36 = TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.primary);

  static const TextStyle textNormalWhite14 = TextStyle(
      fontSize: AppSize.fontSp14,
      color: Colors.white,
      height: 1.4,
      fontWeight: FontWeight.w400);

  static const TextStyle textNormalDark12 = TextStyle(
      fontSize: AppSize.fontSp12,
      color: AppColors.dark2,
      fontWeight: FontWeight.w400,
      height: 1.5);

  static const TextStyle textBoldPrimary12 = TextStyle(
      fontSize: AppSize.fontSp12,
      color: AppColors.primary,
      fontWeight: FontWeight.bold,
      height: 1.5);

  static const TextStyle textNormalDark14 = TextStyle(
      fontSize: AppSize.fontSp14,
      color: Colors.white,
      fontWeight: FontWeight.w400);

  static const TextStyle textDarkGray14 = TextStyle(
    fontSize: AppSize.fontSp14,
    color: AppColors.dark_text_gray,
  );

  static const TextStyle textWhite14 = TextStyle(
    fontSize: AppSize.fontSp14,
    color: Colors.white,
  );

  static const TextStyle text = TextStyle(
      fontSize: AppSize.fontSp14,
      color: AppColors.text,
      // https://github.com/flutter/flutter/issues/40248
      textBaseline: TextBaseline.alphabetic);
  static const TextStyle textDark = TextStyle(
      fontSize: AppSize.fontSp14,
      color: AppColors.dark_text,
      textBaseline: TextBaseline.alphabetic);

  static const TextStyle textGray12 = TextStyle(
      fontSize: AppSize.fontSp12,
      color: AppColors.text_gray,
      fontWeight: FontWeight.normal);
  static const TextStyle textDarkGray12 = TextStyle(
      fontSize: AppSize.fontSp12,
      color: AppColors.dark_text_gray,
      fontWeight: FontWeight.normal);

  static const TextStyle textHint14 = TextStyle(
      fontSize: AppSize.fontSp14, color: AppColors.dark_unselected_item_color);
}
