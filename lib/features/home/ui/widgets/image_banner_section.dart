import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';

class ImageBannerSection extends StatelessWidget {
  const ImageBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.r, left: 10.r),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
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
