import 'package:example_hack2hire/res/colors.dart';
import 'package:example_hack2hire/res/gaps.dart';
import 'package:example_hack2hire/res/size.dart';
import 'package:example_hack2hire/widget/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool border;
  final BorderRadius? borderRadius;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final String? type;
  final Color? backgroundColor;
  final Color? outlineFocus;
  final String? errorText;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final Widget? prefix;
  final Widget? suffix;
  final FocusNode? focusNode;
  final bool? readOnly;
  final bool borderSuffix;
  final bool? showCursor;
  final bool? autofocus;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? containerPadding;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onHiddenText;
  final TextStyle? inputTextStyle;
  final TextAlign? textAlign;
  final int? maxLength;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final Color? borderColor;

  const MyTextField({
    Key? key,
    this.prefix,
    this.suffix,
    this.contentPadding,
    this.obscureText,
    this.outlineFocus,
    this.maxLines = 1,
    required this.controller,
    this.border = false,
    this.borderRadius,
    this.onChanged,
    this.keyboardType,
    this.enableSuggestions,
    this.containerPadding,
    this.autocorrect,
    this.onTap,
    this.type,
    this.onHiddenText,
    this.errorText,
    this.borderSuffix = false,
    this.focusNode,
    this.showCursor,
    this.autofocus = false,
    this.readOnly = false,
    this.hintText,
    this.hintTextStyle,
    this.backgroundColor,
    this.inputTextStyle,
    this.textAlign,
    this.maxLength,
    this.onEditingComplete,
    this.borderColor,
    this.textInputAction,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  FocusNode? focusNode;
  bool isFocus = false;
  bool _isShowDelete = false;

  @override
  void initState() {
    super.initState();

    focusNode = widget.focusNode ?? FocusNode();

    // listen to focus changes
    focusNode?.addListener(() => setState(() {
          isFocus = focusNode!.hasFocus;
        }));
    widget.controller.addListener(isEmpty);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(isEmpty);
    focusNode?.dispose();
  }

  void setFocus() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void isEmpty() {
    final bool isNotEmpty = widget.controller.text.isNotEmpty;
    if (isNotEmpty != _isShowDelete) {
      setState(() {
        _isShowDelete = isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? prefix;
    Widget? suffix;
    Widget? errorTextVisible;

    if (widget.prefix != null) {
      prefix = Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.gapDp8),
        child: widget.prefix,
      );
    }
    if (widget.suffix != null) {
      suffix = Container(
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    color: AppColors.gray4,
                    width: widget.borderSuffix ? 1 : 0))),
        padding: const EdgeInsets.symmetric(horizontal: AppSize.gapDp8),
        child: widget.suffix,
      );
    }
    if (_isShowDelete) {
      suffix = Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.gapDp8),
          child: InkWell(
            onTap: () {
              widget.controller.text = '';
              widget.onChanged?.call("");
            },
            child: const Icon(
              FeatherIcons.x,
              color: AppColors.gray8,
              size: 16,
            ),
          ));
    }

    if (widget.type == null &&
        widget.errorText != null &&
        widget.errorText!.isNotEmpty) {
      suffix = const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.gapDp8),
          child: Icon(
            FeatherIcons.info,
            color: Color(0xFFF04438),
            size: 16,
          ));
    }

    if (widget.type == 'password') {
      suffix = Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.gapDp8),
          child: InkWell(
            onTap: widget.onHiddenText,
            child: Icon(
              widget.obscureText != null && widget.obscureText == false
                  ? FeatherIcons.eye
                  : FeatherIcons.eyeOff,
              color: widget.errorText != null && widget.errorText!.isNotEmpty
                  ? const Color(0xFFF04438)
                  : const Color(0xFF828282),
              size: 16,
            ),
          ));
    }

    if (widget.errorText != null && widget.errorText!.isNotEmpty) {
      errorTextVisible = Column(
        children: [
          AppGaps.vGap4,
          Text(
            widget.errorText as String,
            style: const TextStyle(
                color: Color(0xFFF04438),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.4285),
          )
        ],
      );
    }

    Widget textField = TextField(
      onEditingComplete: widget.onEditingComplete,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign ?? TextAlign.start,
      maxLines: widget.maxLines ?? 1,
      autofocus: widget.autofocus ?? false,
      readOnly: widget.readOnly ?? false,
      showCursor: widget.showCursor,
      focusNode: focusNode,
      onTap: widget.onTap,
      obscureText: widget.obscureText ?? false,
      enableSuggestions: widget.enableSuggestions ?? true,
      autocorrect: widget.autocorrect ?? true,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      controller: widget.controller,
      style: widget.inputTextStyle ?? TextStyles.textGray14,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintTextStyle ?? TextStyles.textGray14,
        isDense: true,
        fillColor: widget.backgroundColor ?? Colors.transparent,
        filled: true,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
        contentPadding: widget.containerPadding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
          borderSide: BorderSide(
            width: widget.border ? 1 : 0,
            color: widget.border
                ? widget.errorText != null && widget.errorText!.isNotEmpty
                    ? const Color(0xFFD92D20)
                    : widget.borderColor ?? const Color(0xFFE0E0E0)
                : Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
            borderSide: BorderSide(
                width: widget.border ? 1 : 0,
                color: widget.border
                    ? isFocus
                        ? widget.outlineFocus ?? AppColors.primary
                        : const Color(0xFFE0E0E0)
                    : Colors.transparent)),
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            textField,
          ],
        ),
        errorTextVisible ?? AppGaps.empty
      ],
    );
  }
}
