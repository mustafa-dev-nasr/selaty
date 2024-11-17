import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
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
        ? buildPortraitLayout(
            itemCount: itemCount,
            subtotal: subtotal,
            total: total,
            context: context,
          )
        : buildLandscapeLayout(
            itemCount: itemCount,
            subtotal: subtotal,
            total: total,
            context: context,
          );
  }

  Widget buildPortraitLayout({
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
            value: "${subtotal.toStringAsFixed(2)}\$",
          ),
          const SummaryRow(label: "رسوم التوصيل", value: "Free"),
          const Spacer(),
          SummaryRow(
            label: "الاجمالي",
            value: "${total.toStringAsFixed(2)}\$",
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget buildLandscapeLayout({
    required int itemCount,
    required double subtotal,
    required double total,
    required BuildContext context,
  }) {
    return Container(
      margin: EdgeInsets.all(10.r),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: SingleChildScrollView(
        // Add this widget for scrolling in landscape
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SummaryRow(label: "البنود", value: "$itemCount"),
            SummaryRow(
              label: "المجموع الفرعي",
              value: "${subtotal.toStringAsFixed(2)}\$",
            ),
            const SummaryRow(label: "رسوم التوصيل", value: "Free"),
            SummaryRow(
              label: "الاجمالي",
              value: "${total.toStringAsFixed(2)}\$",
              isTotal: true,
            ),
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
                    fontSize: 14.sp, // Responsive size
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextStyles.font24BlackSemibold
              : TextStyle(
                  fontSize: isPortrait
                      ? 24.sp
                      : 12.sp, // Responsively adjust font size
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
        ),
        Text(
          value,
          style: isTotal
              ? AppTextStyles.font12BlackRegular
              : TextStyle(
                  fontSize: isPortrait
                      ? 24.sp
                      : 12.sp, // Responsively adjust font size
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
        ),
      ],
    );
  }
}
