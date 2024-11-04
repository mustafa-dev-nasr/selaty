import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';
import '../../../../core/routing/route.dart';
import '../widgets/carousel_slider_widget.dart';
import '../widgets/custom_home_bar.dart';
import '../widgets/header_row.dart';
import '../widgets/horizontal_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgrond,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                SizedBox(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height / 8
                          : MediaQuery.of(context).size.height / 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 120.w
                            : 160.w, // Wider for landscape
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.height / 8
                            : MediaQuery.of(context).size.height / 4,
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Text(
                                'التصفيات',
                                style: AppTextStyles.font16BlackSemibold,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Spacer(),
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  Assets.resourceImagesFruitsCategory,
                                  width: MediaQuery.of(context).orientation ==
                                          Orientation.portrait
                                      ? 120.w
                                      : 160.w, // Adjust width for landscape
                                  height: MediaQuery.of(context).orientation ==
                                          Orientation.portrait
                                      ? 50.h
                                      : 80.h, // Adjust height for landscape
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: -20.h,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 22.r,
                                  ),
                                ),
                                Positioned(
                                  top: -20.h,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    radius: 20.r,
                                    backgroundImage: const AssetImage(
                                      Assets.resourceImagesCategoryIcon,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                HeaderRow(title: 'الاكثر مبيعا'),
                const HorizontalListView(),
                SizedBox(height: 20.h),
                const HorizontalListView(),
                SizedBox(height: 20.h),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: const DecorationImage(
                      image: AssetImage(Assets.resourceImagesFruitsImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                HeaderRow(title: "تسوق حسب العروض"),
                SizedBox(height: 20.h),
                const MyGridView(),
                20.verticalSpace,
                HeaderRow(title: 'طازج وسريع'),
                20.verticalSpace,
                const HorizontalListView(),
                20.verticalSpace,
                const HorizontalListView(),
                20.verticalSpace,
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: const DecorationImage(
                      image: AssetImage(Assets.resourceImagesFruitsImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                20.verticalSpace,
                HeaderRow(title: 'أنتز الفرصه'),
                20.verticalSpace,
                const HorizontalListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: 10.h), // Optional spacing between rows
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FreeCard(screenWidth: screenWidth),
            FreeCard(screenWidth: screenWidth),
            FreeCard(screenWidth: screenWidth),
          ],
        ),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FreeCard(screenWidth: screenWidth),
            FreeCard(screenWidth: screenWidth),
            FreeCard(screenWidth: screenWidth),
          ],
        ),
      ],
    );
  }
}

class FreeCard extends StatelessWidget {
  const FreeCard({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (screenWidth - 60.w) / 3, // Fit 3 items with spacing
      height: MediaQuery.of(context).size.height / 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.grey,
      ),
      child: Center(
        child: Text(
          'Item',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
