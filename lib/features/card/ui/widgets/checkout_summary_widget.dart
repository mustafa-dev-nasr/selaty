import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/theming/app_text_styles.dart';

class CheckoutSummaryWidget extends StatelessWidget {
  final int itemCount;
  final double subtotal;
  final double total;

  const CheckoutSummaryWidget({
    Key? key,
    required this.itemCount,
    required this.subtotal,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SummaryRow(label: "المجموع الفرعي", value: "${subtotal.toStringAsFixed(2)}\$"),
          SummaryRow(label: "رسوم التوصيل", value: "Free"),
          const Spacer(),
          SummaryRow(label: " الاجمالي", value: "${total.toStringAsFixed(2)}\$", isTotal: true),
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const SummaryRow({
    Key? key,
    required this.label,
    required this.value,
    this.isTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal ? AppTextStyles.font24BlackSemibold : TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(
          value,
          style: isTotal ? AppTextStyles.font24BlackSemibold : TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ],
    );
  }
}
