import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/features/home/ui/widgets/image_banner_section.dart';
import 'package:selaty/features/home/ui/widgets/grid_item.dart';
import '../../../../constants/assets.dart';
import '../../../../core/routing/route.dart';
import '../widgets/adaptive_horizontal_list.dart';
import '../widgets/carousel_slider_widget.dart';
import '../widgets/custom_home_bar.dart';
import '../widgets/header_row.dart';
import '../widgets/product_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortraitLayout =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgrond,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.w,
            vertical: isPortraitLayout ? 20.h : 8.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomHomeBar(),
                SizedBox(height: 10.h),
                _buildHeaderRow(
                  title: 'القيمه الافضل',
                  subtitle: "اعلي مبيعات",
                ),
                const CustomCarouselSlider(),
                SizedBox(height: 10.h),
                _buildHeaderRow(
                  title: 'التصفيات',
                  onTap: () => context.pushNamed(Routes.qualifiers),
                ),
                const AdaptiveHorizontalList(itemCount: 10),
                SizedBox(height: 10.h),
                _buildHeaderRow(title: 'الاكثر مبيعا'),
                const ProductGridView(),
                SizedBox(height: 20.h),
                const ImageBannerSection(),
                SizedBox(height: 20.h),
                _buildHeaderRow(title: "تسوق حسب العروض"),
                SizedBox(height: 20.h),
                _buildGridView(isPortraitLayout, context),
                SizedBox(height: 20.h),
                _buildHeaderRow(title: 'طازج وسريع'),
                SizedBox(height: 20.h),
                const ProductGridView(),
                SizedBox(height: 20.h),
                const ImageBannerSection(),
                SizedBox(height: 20.h),
                _buildHeaderRow(title: 'أنتز الفرصه'),
                SizedBox(height: 20.h),
                _buildHorizontalListView(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow({
    required String title,
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return HeaderRow(
      title: title,
      subtitle: subtitle,
      onTap: onTap,
    );
  }

  Widget _buildGridView(bool isPortraitLayout, BuildContext context) {
    return SizedBox(
      height: isPortraitLayout
          ? MediaQuery.of(context).size.height / 3
          : MediaQuery.of(context).size.height * 1.3,
      child: GridView.builder(
        padding: EdgeInsets.all(10.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 1.0,
        ),
        itemCount: 6,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => GridItem(index: index),
      ),
    );
  }

  Widget _buildHorizontalListView(BuildContext context) {
    bool isPortraitLayout =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return SizedBox(
      height: isPortraitLayout
          ? MediaQuery.of(context).size.height / 3.5
          : MediaQuery.of(context).size.height /
              1.2, // Adjust height for landscape
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        itemCount: 6,
        itemBuilder: (context, index) {
          return _buildListItem(context, index, isPortraitLayout);
        },
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context, int index, bool isPortraitLayout) {
    return Container(
      width: isPortraitLayout ? 150.w : 100.w,
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: white,
      ),
      child: Stack(
        children: [
          Positioned(
            top: isPortraitLayout ? 50.h : 80,
            left: 0,
            right: 0,
            child: _buildImage(context),
          ),
          Positioned(
            right: 8.w,
            top: isPortraitLayout ? 3.h : 10.h,
            child: _buildTextColumn(context),
          ),
          Positioned(
            bottom: 0,
            child: _buildBottomContainer(context),
          ),
          Positioned(
            right: 8.w,
            bottom: 23.h,
            child: _buildArrowIcon(),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(context) {
    final isPortraitLayout =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Image.asset(
      Assets.resourceImagesPngwin,
      height: isPortraitLayout ? 130.h : 180.h,
      fit: BoxFit.cover,
    );
  }

  Widget _buildTextColumn(BuildContext context) {
    final isPortraitLayout =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'طبق فواكه',
          style: TextStyle(
              color: Colors.black, fontSize: isPortraitLayout ? 14.sp : 10.sp),
        ),
        Text(
          'خصم 25%  \n بدون فوائد ',
          style: TextStyle(
            color: Colors.black,
            fontSize: isPortraitLayout ? 14.sp : 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomContainer(BuildContext context) {
    final isPortraitLayout =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      width: isPortraitLayout ? 150.w : 100.w,
      height: isPortraitLayout ? 30.w : 20.w,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
        ),
      ),
    );
  }

  Widget _buildArrowIcon() {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
