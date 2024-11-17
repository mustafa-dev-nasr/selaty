import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/theming/app_colors.dart';
import '../../../home/ui/widgets/build_landscape_layout_product_grid_item.dart';
import '../../../home/ui/widgets/build_portrait_layout_product_grid_item.dart';
import '../widgets/ProductCard.dart';
import '../widgets/category_header.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  const CategoriesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortraitOrientation =
        MediaQuery.of(context).orientation == Orientation.portrait;

    // Dynamically adjust the number of columns based on screen width
    final crossAxisCount =
        screenWidth > 600 ? 3 : 2; // 3 columns for wider screens

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgrond,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Category Header
            const SliverToBoxAdapter(
              child: CategoryHeader(
                categoryTitle: 'التصفيات',
              ),
            ),
            // Spacer between header and grid
            SliverPadding(
              padding: EdgeInsets.only(top: 20.h),
            ),
            // Grid View as a SliverGrid
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount, // Adjust columns dynamically
                mainAxisSpacing: 10.w,
                childAspectRatio: isPortraitOrientation
                    ? .65
                    : .8, // Adjust aspect ratio based on orientation
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return isPortraitOrientation
                      ? const BuildPortraitLayoutProductGridItem()
                      : const BuildLandscapeLayoutProductGridItem();
                },
                childCount: 10, // Adjust number of items as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
