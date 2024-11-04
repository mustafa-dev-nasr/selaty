import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? backgroundColor;
  final void Function()? onPressed;
  final String buttonText;
  final TextStyle textStyle;

  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.textStyle,
    this.borderRadius,
    this.verticalPadding,
    this.horizontalPadding,
    this.buttonWidth,
    this.buttonHeight,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? AppColors.lightRed,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all<Size>(
          Size(buttonWidth?.w ?? double.infinity, buttonHeight?.h ?? 75.h),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
