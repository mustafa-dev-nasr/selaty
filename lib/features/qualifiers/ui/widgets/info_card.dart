import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_text_styles.dart';
import 'package:selaty/core/routing/route.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String bcImagePath;

  const InfoCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.bcImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return GestureDetector(
      onTap: () => context.pushNamed(Routes.categoriesDetails),
      child: Container(
        margin: EdgeInsets.only(left: 10.w),
        width: screenWidth * (isPortrait ? 0.3 : 0.2),
        height: screenHeight * (isPortrait ? 0.25 : 0.2),
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
                title,
                style: AppTextStyles.font16BlackSemibold,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                      child: Image.asset(
                        bcImagePath,
                        width: screenWidth * (isPortrait ? 0.5 : 0.6),
                        height: isPortrait
                            ? screenHeight / 15
                            : screenHeight * 0.15,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: isPortrait ? 15.h : 30.h,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: isPortrait ? 22.r : 25.r,
                    ),
                  ),
                  Positioned(
                    top: isPortrait ? 15.h : 30.h,
                    child: CircleAvatar(
                      backgroundColor: isPortrait ? Colors.red : Colors.orange,
                      radius: isPortrait ? 20.r : 22.r,
                      backgroundImage: AssetImage(imagePath),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
