import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';

class ImageBannerSection extends StatelessWidget {
  const ImageBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Detect orientation
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.r),
      width: double.infinity,
      height: isLandscape
          ? MediaQuery.of(context).size.height / 1.7 // For landscape
          : MediaQuery.of(context).size.height / 5, // For portrait
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: const DecorationImage(
          image: AssetImage(Assets.resourceImagesFruitsImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
