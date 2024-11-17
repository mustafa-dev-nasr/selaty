import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';
import 'build_portrait_layout_product_grid_item.dart'; // Import the new widget
import 'build_landscape_layout_product_grid_item.dart'; // Import landscape layout widget

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortraitOrientation =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return SizedBox(
      height: isPortraitOrientation
          ? MediaQuery.of(context).size.height / 1.6
          : MediaQuery.of(context).size.height * 2,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Adjust for portrait vs landscape
          mainAxisSpacing: 10.w,
          childAspectRatio:
              isPortraitOrientation ? 1.3 : 1.5, // Adjust aspect ratio
        ),
        itemCount: 10, // Adjust number of items as needed
        itemBuilder: (context, index) {
          return isPortraitOrientation
              ? const BuildPortraitLayoutProductGridItem() // Portrait layout item
              : const BuildLandscapeLayoutProductGridItem(); // Landscape layout item
        },
      ),
    );
  }
}
