import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/routing/route.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';

class BuildPortraitLayoutProductGridItem extends StatelessWidget {
  const BuildPortraitLayoutProductGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          _buildProductImage(),
          _buildFavoriteIcon(),
          _buildNewBadge(),
          _buildProductDetails(),
          _buildPriceAndAvatar(context),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Positioned(
      top: 40.h,
      left: 0.w,
      right: 0.w,
      child: Image.asset(
        Assets.resourceImagesPngwin,
        width: 100.w,
        height: 150.h,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildFavoriteIcon() {
    return Positioned(
      left: 0.w,
      top: -10.h,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.favorite,
          color: AppColors.softGreen,
        ),
      ),
    );
  }

  Widget _buildNewBadge() {
    return Positioned(
      top: 4.h,
      right: 4.w,
      child: Container(
        width: 50.w,
        height: 25.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.softGreen,
        ),
        child: Text(
          "جديد",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Positioned(
      bottom: 50.h,
      right: 2.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60.w,
            height: 25.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.orange,
            ),
            child: Text(
              "فواكه",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "طبق فواكه",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp,
            ),
          ),
          Text(
            "Kg",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceAndAvatar(BuildContext c) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 3.w),
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          color: const Color.fromARGB(255, 236, 232, 232),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                "400 EGP",
                style:
                    AppTextStyles.font16BlackSemibold.copyWith(fontSize: 16.sp),
              ),
            ),
            _buildAvatarIcon(c),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarIcon(BuildContext c) {
    return GestureDetector(
      onTap: () {
        c.pushNamed(Routes.cardScreen);
      },
      child: Container(
        width: 40.r, // Adjust based on your `radius` requirement
        height: 40.r,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            Assets.resourceImagesAdd,
            color: Colors.white,
            width: 20.r, // Adjust size as needed
            height: 20.r,
          ),
        ),
      ),
    );
  }
}
