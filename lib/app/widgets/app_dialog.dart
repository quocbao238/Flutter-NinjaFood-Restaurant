import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';

enum AppDialogType {
  error,
  success,
  warning,
  info,
}

class AppDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? leftBtnText;
  final String? rightBtnText;
  final VoidCallback? leftBtnOnPressed;
  final VoidCallback? rightBtnOnPressed;
  final AppDialogType _type;
  final Animation<double> animation;

  const AppDialog.error(
      {required this.title,
      required this.message,
      this.leftBtnText = 'Cancel',
      this.rightBtnText = 'OK',
      this.leftBtnOnPressed,
      this.rightBtnOnPressed,
      required this.animation})
      : _type = AppDialogType.error;

  const AppDialog.success(
      {required this.title,
      required this.message,
      this.leftBtnText,
      this.rightBtnText,
      this.leftBtnOnPressed,
      this.rightBtnOnPressed,
      required this.animation})
      : _type = AppDialogType.success;

  const AppDialog.warning(
      {required this.title,
      required this.message,
      this.leftBtnText,
      this.rightBtnText,
      this.leftBtnOnPressed,
      this.rightBtnOnPressed,
      required this.animation})
      : _type = AppDialogType.warning;

  const AppDialog.info(
      {required this.title,
      required this.message,
      this.leftBtnText,
      this.rightBtnText,
      this.leftBtnOnPressed,
      this.rightBtnOnPressed,
      required this.animation})
      : _type = AppDialogType.info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Get.theme.colorScheme.primary.withOpacity(0.4),
                    blurRadius: 4,
                    offset: const Offset(0, 2)),
                BoxShadow(
                    color: Get.theme.colorScheme.primary.withOpacity(0.4),
                    blurRadius: 4,
                    offset: const Offset(2, 0)),
              ],
            ),
            child: AppSizeScale(
              ratioWidth: 0.75,
              child: AppPadding.medium(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppPadding.small(
                        child: AppText.titleMedium(
                            text: title,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.textRedColor)),
                    AppPadding(
                        padding: AppEdgeInsets.symmetric(
                            horizontal: AppGapSize.small,
                            vertical: AppGapSize.medium),
                        child: AppText.bodyMedium(text: message)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _txtBtn(
                            text: leftBtnText,
                            onPressed: leftBtnOnPressed,
                            backgroundColor:
                                ThemeColors.textRedColor.withOpacity(0.4)),
                        _txtBtn(
                            text: rightBtnText,
                            onPressed: rightBtnOnPressed,
                            backgroundColor:
                                Get.theme.colorScheme.primary.withOpacity(0.4)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _txtBtn(
      {String? text, VoidCallback? onPressed, required Color backgroundColor}) {
    if (onPressed == null || text == null) return SizedBox.shrink();
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      onPressed: onPressed,
      child: AppText.bodySmall(text: text),
    );
  }
}
