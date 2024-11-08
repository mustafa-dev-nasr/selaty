// lib/widgets/cart_item_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';

import '../../data/models/cart_item_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight / 5,
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: onDecrement,
              ),
              Text(
                '${item.quantity}',
                style: AppTextStyles.font20BlackBold,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: onIncrement,
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    " x${item.quantity}",
                    style: TextStyle(
                      color: AppColors.softGreen,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  8.horizontalSpace,
                  Text(
                    "${item.price}\$",
                    style: TextStyle(
                      color: AppColors.softGreen,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              Text(item.name, style: AppTextStyles.font24BlackSemibold),
              8.verticalSpace,
              Text("1 kg", style: AppTextStyles.font16BlackRegular),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
