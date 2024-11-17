import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/theming/app_text_styles.dart';

import '../../../../core/routing/route.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_text_button.dart';

class CheckoutSummaryWidget extends StatelessWidget {
  final int itemCount;
  final double subtotal;
  final double total;

  const CheckoutSummaryWidget({
    super.key,
    required this.itemCount,
    required this.subtotal,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final screenOrientation = MediaQuery.of(context).orientation;

    return screenOrientation == Orientation.portrait
        ? BuildPortraitLayout(
            itemCount: itemCount,
            subtotal: subtotal,
            total: total,
            context: context)
        : BuildLandscapeLayout(
            itemCount: itemCount,
            subtotal: subtotal,
            total: total,
            context: context);
  }

  Widget BuildPortraitLayout({
    required int itemCount,
    required double subtotal,
    required double total,
    required BuildContext context,
  }) {
    return Container(
      margin: EdgeInsets.all(10.r),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SummaryRow(label: "البنود", value: "$itemCount"),
          SummaryRow(
              label: "المجموع الفرعي",
              value: "${subtotal.toStringAsFixed(2)}\$"),
          const SummaryRow(label: "رسوم التوصيل", value: "Free"),
          const Spacer(),
          SummaryRow(
              label: " الاجمالي",
              value: "${total.toStringAsFixed(2)}\$",
              isTotal: true),
        ],
      ),
    );
  }

  Widget BuildLandscapeLayout({
    required int itemCount,
    required double subtotal,
    required double total,
    required BuildContext context,
  }) {
    return Container(
      margin: EdgeInsets.all(10.r),
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SummaryRow(label: "البنود", value: "$itemCount"),
            // 20.verticalSpace,
            SummaryRow(
                label: "المجموع الفرعي",
                value: "${subtotal.toStringAsFixed(2)}\$"),
            // 80.verticalSpace,
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextButton(
                  onPressed: () {
                    context.pushNamed(Routes.emptyCartScreen);
                  },
                  backgroundColor: AppColors.softGreen,
                  buttonText: "الدفع",
                  textStyle: AppTextStyles.font22WhiteMedium.copyWith(
                    fontSize: 10.sp, // Responsive size
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextStyles.font24BlackSemibold
              : TextStyle(
                  fontSize: isPortrait
                      ? 24.sp
                      : 10.sp, // Responsively adjust font size
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
        ),
        Text(
          value,
          style: isTotal
              ? AppTextStyles.font24BlackSemibold
              : TextStyle(
                  fontSize: isPortrait
                      ? 24.sp
                      : 12.sp, // Responsively adjust font size
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
        ),
      ],
    );
  }
}

// Expanded section for displaying the summary widget
