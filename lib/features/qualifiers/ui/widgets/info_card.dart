import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_text_styles.dart';
import '../../../../core/routing/route.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String bcImagePath;
  final double width;
  final double height;

  const InfoCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.bcImagePath,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.categoriesDetails);
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 10.w,
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Text(
                title,
                style: AppTextStyles.font16BlackSemibold,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(flex: 2),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r)),
                  child: Image.asset(
                    bcImagePath,
                    width: width,
                    height: height / 1.7,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: -20.h,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22.r,
                  ),
                ),
                Positioned(
                  top: -20.h,
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 20.r,
                    backgroundImage: AssetImage(imagePath,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
