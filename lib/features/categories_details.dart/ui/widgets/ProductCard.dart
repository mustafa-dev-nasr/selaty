import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/theming/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final Function()? onFavoritePressed;

  const ProductCard({
    super.key,
    required this.imagePath,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w, left: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              imagePath,
              width: 120.w,
              height: 150.h,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 0.w,
            top: -10.h,
            child: IconButton(
              onPressed: onFavoritePressed,
              icon: const Icon(
                Icons.favorite,
                color: AppColors.softGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
