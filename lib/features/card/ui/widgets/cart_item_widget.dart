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
    final screenOrientation = MediaQuery.of(context).orientation;

    return screenOrientation == Orientation.portrait
        ? BuildPortraitLayout(
            item: item,
            onIncrement: onIncrement,
            onDecrement: onDecrement,
            context: context)
        : BuildLandscapeLayout(
            item: item,
            onIncrement: onIncrement,
            onDecrement: onDecrement,
            context: context);
  }

  Widget BuildPortraitLayout({
    required CartItem item,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
    required BuildContext context,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight / 5, // Adjust height based on screen size
      margin: EdgeInsets.all(10.w), // Dynamic margin based on screen width
      padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h), // Dynamic padding based on screen size
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(10.r), // Use r for responsive radius
      ),
      child: Row(
        children: [
          // Quantity controls
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: onDecrement,
              ),
              Text(
                '${item.quantity}',
                style: AppTextStyles.font20BlackBold.copyWith(
                  fontSize: 20.sp, // Responsive font size
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: onIncrement,
              ),
            ],
          ),
          const Spacer(),
          // Item details
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
                      fontSize: 20.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.w), // Responsive space
                  Text(
                    "${item.price}\$",
                    style: TextStyle(
                      color: AppColors.softGreen,
                      fontSize: 20.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h), // Responsive space
              Text(
                item.name,
                style: AppTextStyles.font24BlackSemibold.copyWith(
                  fontSize: 24.sp, // Responsive font size
                ),
              ),
              SizedBox(height: 8.h), // Responsive space
              Text(
                "1 kg",
                style: AppTextStyles.font16BlackRegular.copyWith(
                  fontSize: 16.sp, // Responsive font size
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget BuildLandscapeLayout({
    required CartItem item,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
    required BuildContext context,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight / 2, // Adjust height for landscape
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          // Quantity controls
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: onDecrement,
              ),
              Text(
                '${item.quantity}',
                style: AppTextStyles.font20BlackBold.copyWith(
                  fontSize: 15.sp,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: onIncrement,
              ),
            ],
          ),
          const Spacer(),
          // Item details
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        " x${item.quantity}",
                        style: TextStyle(
                          color: AppColors.softGreen,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "${item.price}\$",
                        style: TextStyle(
                          color: AppColors.softGreen,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    item.name,
                    style: AppTextStyles.font24BlackSemibold.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "1 kg",
                    style: AppTextStyles.font16BlackRegular.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
