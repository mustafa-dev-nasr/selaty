import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/theming/app_colors.dart';
import '../widgets/ProductCard.dart';
import '../widgets/category_header.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  const CategoriesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgrond,
      body: SafeArea(
        child: Column(
          children: [
            const CategoryHeader(
              categoryTitle: 'التصفيات',
            ),
            SizedBox(height: 20.h),
            Flexible(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: (MediaQuery.of(context).size.width / 2) /
                      (screenHeight / 4),
                ),
                itemCount: 10, // Replace with dynamic item count if needed
                itemBuilder: (context, index) {
                  return ProductCard(
                    imagePath: Assets.resourceImagesPngwin,
                    onFavoritePressed: () {
                      // Handle favorite action
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
