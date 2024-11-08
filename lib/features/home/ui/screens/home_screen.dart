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
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgrond,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomHomeBar(),
                SizedBox(height: 10.h),
                HeaderRow(
                  title: 'القيمه الافضل',
                  subtitle: "اعلي مبيعات",
                ),
                const CustomCarouselSlider(),
                SizedBox(height: 10.h),
                HeaderRow(
                  title: 'التصفيات',
                  onTap: () {
                    context.pushNamed(Routes.qualifiers);
                  },
                ),
                const AdaptiveHorizontalList(itemCount: 10),
                SizedBox(height: 10.h),
                HeaderRow(title: 'الاكثر مبيعا'),
                const ProductGridView(),
                SizedBox(height: 20.h),
                const ImageBannerSection(),
                SizedBox(height: 20.h),
                HeaderRow(title: "تسوق حسب العروض"),
                SizedBox(height: 20.h),
                // GridView for displaying items in 3 columns with different colors
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.24,
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
                    itemBuilder: (context, index) {
                      return GridItem(index: index);
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                HeaderRow(title: 'طازج وسريع'),
                SizedBox(height: 20.h),
                const ProductGridView(),
                SizedBox(height: 20.h),
                const ImageBannerSection(),
                SizedBox(height: 20.h),
                HeaderRow(title: 'أنتز الفرصه'),
                SizedBox(height: 20.h),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(10.w),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 150.w,
                        margin: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: white,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 30.h,
                              left: 0,
                              right: 0,
                              child: Image.asset(
                                Assets.resourceImagesPngwin,
                                width: 100.w,
                                height: 130.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                right: 8.w,
                                top: 3.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'طبق فواكه',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16.sp),
                                    ),
                                    Text(
                                      'خصم 25%  \n بدون فوائد ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: 150.w,
                                height: 30.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.r),
                                      bottomRight: Radius.circular(10.r)),
                                ),
                              ),
                            ),
                            Positioned(
                                right: 8.w,
                                bottom: 23.h,
                                child: Container(
                                  padding: EdgeInsets.all(2.w),
                                  // width: 20.w,
                                  // height: 20.w,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    // borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
