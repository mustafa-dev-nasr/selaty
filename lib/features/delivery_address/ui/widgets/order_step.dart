import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class OrderStep extends StatelessWidget {
  final String title;
  final String date;
  final String? subtitle;
  final bool isActive;
  final bool isLastStep;
  final VoidCallback onTap;

  const OrderStep({
    super.key,
    required this.title,
    required this.date,
    this.subtitle,
    this.isActive = false,
    this.isLastStep = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 16.r,
                  backgroundColor:
                      isActive ? AppColors.softGreen : Colors.grey[400],
                  child: Icon(
                    Icons.list,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                ),
                if (!isLastStep)
                  Container(
                    width: 2.w,
                    height: 40.h,
                    color: isActive ? AppColors.softGreen : Colors.grey[400],
                  ),
              ],
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: isActive ? AppColors.softGreen : Colors.grey[700],
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
