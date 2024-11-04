import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final itemHeight = orientation == Orientation.portrait
        ? MediaQuery.of(context).size.height / 3.5
        : MediaQuery.of(context).size.height / 1.5;

    return SizedBox(
      height: itemHeight,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Adjust the number of items as needed
        itemBuilder: (context, index) {
          return _buildListItem(context, orientation);
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Orientation orientation) {
    return Container(
      width: orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width / 2.5
          : MediaQuery.of(context).size.width / 3.5,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              Assets.resourceImagesPngwin,
              width: orientation == Orientation.portrait ? 120.w : 120.w,
              height: orientation == Orientation.portrait ? 150.h : 300.h,
              fit: BoxFit.fill,
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
            child: _buildNewBadge(context),
          ),
          Positioned(
            bottom: 50.h,
            right: 2.w,
            child: _buildProductDetails(context),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildPriceAndAvatar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildNewBadge(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Container(
      width: orientation == Orientation.portrait ? 50.w : 70.w,
      height: orientation == Orientation.portrait ? 25.h : 60.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.softGreen,
      ),
      child: Text(
        "جديد",
        style: TextStyle(
          color: Colors.white,
          fontSize: orientation == Orientation.portrait ? 12.sp : 14.sp,
        ),
      ),
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: orientation == Orientation.portrait ? 60.w : 80.w,
          height: orientation == Orientation.portrait ? 25.h : 60.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.orange,
          ),
          child: Text(
            "فواكه",
            style: TextStyle(
              color: Colors.white,
              fontSize: orientation == Orientation.portrait ? 12.sp : 14.sp,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "طبق فواكه",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: gray,
            fontSize: orientation == Orientation.portrait ? 12.sp : 14.sp,
          ),
        ),
        Text(
          " Kg",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: gray,
            fontSize: orientation == Orientation.portrait ? 12.sp : 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndAvatar(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Container(
      height: orientation == Orientation.portrait
          ? 40.h
          : 50.h, // Adjust height based on orientation
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
            padding: EdgeInsets.symmetric(
              horizontal: orientation == Orientation.portrait
                  ? 10.w
                  : 15.w, // Adjust padding
            ),
            child: Text(
              "400 EGP",
              style: AppTextStyles.font16BlackSemibold.copyWith(
                fontSize: orientation == Orientation.portrait
                    ? 16.sp
                    : 12.sp, // Adjust font size
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: orientation == Orientation.portrait
                ? 20.r
                : 25.r, // Adjust radius
            backgroundImage: const AssetImage(
              Assets.resourceImagesCategoryIcon,
            ),
          ),
        ],
      ),
    );
  }
}
