import 'package:example_hack2hire/res/colors.dart';
import 'package:example_hack2hire/res/gaps.dart';
import 'package:example_hack2hire/res/size.dart';
import 'package:example_hack2hire/widget/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar(
      {Key? key,
      this.backgroundColor,
      this.title = '',
      this.centerTitle = '',
      this.onPressed,
      this.isBack = true,
      this.avatar,
      this.hintText = '',
      this.onChanged,
      this.actions,
      this.onClear,
      this.onGoBack})
      : super(key: key);

  final String hintText;
  final String centerTitle;
  final String title;
  final Color? backgroundColor;
  final Widget? avatar;
  final bool isBack;
  final Widget? actions;
  final Function(String)? onChanged;
  final Function()? onClear;
  final Function()? onGoBack;
  final Function(String)? onPressed;

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(45.0);
}

class _MyAppBarState extends State<MyAppBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget? back;
    if (widget.isBack) {
      back = InkWell(
        onTap: () async {
          FocusManager.instance.primaryFocus?.unfocus();
          final isBack = await Navigator.maybePop(context);
          if (!isBack) {
            widget.onGoBack?.call();
            await SystemNavigator.pop();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          child: const Icon(
            FeatherIcons.arrowLeft,
            size: 16,
            color: AppColors.gray8,
          ),
        ),
      );
    } else {
      back = const SizedBox();
    }

    if (widget.avatar != null) {
      back = widget.avatar;
    }

    final Widget actions = widget.actions != null
        ? Positioned(
            right: 0.0,
            child: widget.actions ?? AppGaps.empty,
          )
        : AppGaps.empty;

    final Widget titleWidget = Container(
      alignment:
          widget.centerTitle.isEmpty ? Alignment.centerLeft : Alignment.center,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Text(
        widget.title.isEmpty ? widget.centerTitle : widget.title,
        style: TextStyles.textBold18,
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Material(
        color: AppColors.light2,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.gapDp8),
            decoration: const BoxDecoration(
                color: AppColors.light2,
                border: Border(
                    bottom: BorderSide(width: 1, color: AppColors.gray1))),
            child: Column(
              children: [
                AppGaps.vGap8,
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    titleWidget,
                    back ?? AppGaps.empty,
                    actions,
                  ],
                ),
                AppGaps.vGap12,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
