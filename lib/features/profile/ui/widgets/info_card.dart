import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_colors.dart';

import '../../../../core/widgets/custom_icon_bar.dart';
import '../../../home/ui/screens/home_screen.dart';
import '../widgets/add_image.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    // Calculate width dynamically for fitting items with spacing
    final double cardWidth = (screenWidth - 60.w) / 3.5;

    return Container(
      width: cardWidth,
      height: 0.12.sh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Adds a subtle shadow
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.person,
              color: AppColors.lightRed,
            ),
            Text(
              'عني',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
