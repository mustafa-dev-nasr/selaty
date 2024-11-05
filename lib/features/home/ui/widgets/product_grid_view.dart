import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final isorientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.6,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isorientation ? 2 : 4,
          mainAxisSpacing: 10.w,
          childAspectRatio: 1.3, // Adjust as needed
        ),
        itemCount: 10, // Adjust the number of items as needed
        itemBuilder: (context, index) {
          return _buildGridItem(context); // Build each grid item
        },
      ),
    );
  }

  Widget _buildGridItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 40.h,
            left: 0.w,
            right: 0.w,
            child: Image.asset(
              Assets.resourceImagesPngwin,
              width: 100.w,
              height: 150.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0.w,
            top: -10.h,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: AppColors.softGreen,
              ),
            ),
          ),
          Positioned(
            top: 4.h,
            right: 4.w,
            child: _buildNewBadge(),
          ),
          Positioned(
            bottom: 50.h,
            right: 2.w,
            child: _buildProductDetails(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildPriceAndAvatar(),
          ),
        ],
      ),
    );
  }

  Widget _buildNewBadge() {
    return Container(
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
    );
  }

  Widget _buildProductDetails() {
    return Column(
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
          " Kg",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndAvatar() {
    return Container(
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
          Container(
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
          )
        ],
      ),
    );
  }
}
