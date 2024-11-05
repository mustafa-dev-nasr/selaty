// header_row.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';

import '../../../../core/theming/app_colors.dart';

class HeaderRow extends StatelessWidget {
  HeaderRow({super.key, required this.title, this.subtitle, this.onTap});
  final String title;
  final String? subtitle;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        children: [
          Text(title, style: AppTextStyles.font22BlackMedium),
          SizedBox(width: 10.w),
          Text(subtitle ?? "", style: AppTextStyles.font20GrayMedium),
          const Spacer(),
          IconButton(
            onPressed: onTap, // Implement the back navigation logic if needed
            icon: Icon(Icons.arrow_back_ios_new_sharp, color: gray, size: 20.w),
          ),
          GestureDetector(
              onTap: onTap,
              child: Text("مشاهده الكل",
                  style: TextStyle(color: gray, fontSize: 16.sp))),
        ],
      ),
    );
  }
}
