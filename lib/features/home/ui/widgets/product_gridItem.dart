import 'package:flutter/material.dart';
import 'package:selaty/features/home/ui/widgets/build_landscape_layout_product_grid_item.dart';
import 'package:selaty/features/home/ui/widgets/build_portrait_layout_product_grid_item.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return orientation == Orientation.portrait
        ? const BuildPortraitLayoutProductGridItem()
        : const BuildLandscapeLayoutProductGridItem();
  }
}
