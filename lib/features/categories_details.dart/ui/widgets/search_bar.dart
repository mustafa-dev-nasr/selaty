import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/widgets/add_text_form_field.dart';
import '../../../../core/theming/app_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 55.w,
          height: 55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.vibrantRed,
          ),
          child: const Icon(Icons.format_list_bulleted_rounded,
              color: Colors.white),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: AppTextFormField(
            hintText: "البحث عن المنتجات",
            suffixIcon: const Icon(Icons.search_rounded, color: Colors.grey),
            prefixIcon: const Icon(Icons.cancel_outlined, color: Colors.black),
            validator: (value) {
              // Add validation logic if needed
            },
          ),
        ),
      ],
    );
  }
}
