import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/constants/assets.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    // Detect the current orientation of the screen
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * (isPortrait ? 0.2 : 0.4),
        enlargeCenterPage: true,
        viewportFraction: isPortrait ? 1 : 0.5,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                image: const DecorationImage(
                  image: AssetImage(Assets.resourceImagesFruitsCategory),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
