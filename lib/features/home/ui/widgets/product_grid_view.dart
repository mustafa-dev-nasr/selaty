import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';
import 'product_grid_item.dart'; // Import the new widget

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortraitOrientation = MediaQuery.of(context).orientation == Orientation.portrait;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.6,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPortraitOrientation ? 2 : 4,
          mainAxisSpacing: 10.w,
          childAspectRatio: 1.3, // Adjust as needed
        ),
        itemCount: 10, // Adjust the number of items as needed
        itemBuilder: (context, index) {
          return const ProductGridItem(); // Reusing the external widget
        },
      ),
    );
  }
}
