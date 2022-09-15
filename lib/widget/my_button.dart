import 'package:example_hack2hire/res/colors.dart';
import 'package:example_hack2hire/res/gaps.dart';
import 'package:example_hack2hire/res/size.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    this.icon,
    this.text = '',
    this.disabled = false,
    this.fontSize = AppSize.fontSp18,
    this.textColor,
    this.disabledTextColor,
    this.fontWeight = FontWeight.w400,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.minHeight = 48.0,
    this.minWidth = double.infinity,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.radius = 2.0,
    this.side = BorderSide.none,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final bool disabled;
  final FontWeight fontWeight;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final double? minHeight;
  final double? minWidth;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double radius;
  final BorderSide side;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (!disabled) {
          onPressed?.call();
        }
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledTextColor ?? AppColors.text_disabled;
            }
            return textColor ?? Colors.white;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return disabledBackgroundColor ?? (AppColors.button_disabled);
          }
          return backgroundColor ?? AppColors.primary;
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return (textColor ?? Colors.white).withOpacity(0.12);
        }),
        minimumSize: (minWidth == null || minHeight == null)
            ? null
            : MaterialStateProperty.all<Size>(Size(minWidth!, minHeight!)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(side),
      ),
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? Container(),
                Visibility(
                  visible: text.isNotEmpty,
                  child: Row(
                    children: [
                      AppGaps.hGap8,
                      Text(
                        text,
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: fontWeight),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Text(
              text,
              style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
            ),
    );
  }
}
