import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/theming/app_text_styles.dart';

import '../../../../core/routing/route.dart';

class InfoCard extends StatelessWidget {
  final String title; // Title of the card
  final String imagePath; // Path to the image
  final double width; // Width of the card
  final double height; // Height of the card

  const InfoCard({
    super.key,
    required this.title,
    required this.imagePath,
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
        width: width, // Set the width of the card
        height: height, // Set the height of the card
        margin: EdgeInsets.only(right: 10.w), // Add right margin
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r), // Rounded corners
          color: Colors.white, // Card background color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align items at the top
          children: [
            Padding(
              padding: EdgeInsets.all(8.w), // Padding around the title
              child: Text(
                title, // Display the title
                style: AppTextStyles
                    .font16BlackSemibold, // Text style for the title
                textAlign: TextAlign.center, // Center align the title
              ),
            ),
            const Spacer(), // Add space between title and image
            Stack(
              clipBehavior: Clip.none, // Allow overflow for positioned children
              alignment: Alignment.center, // Center align children in the stack
              children: [
                Image.asset(
                  imagePath, // Load the image
                  width: width, // Set the image width
                  height: height /
                      1.2, // Set the image height (half of card height)
                  fit: BoxFit.cover, // Cover the image area
                ),
                Positioned(
                  top: -20.h, // Positioning above the card
                  child: CircleAvatar(
                    backgroundColor:
                        Colors.white, // Background color of the outer circle
                    radius: 22.r, // Outer circle radius
                  ),
                ),
                Positioned(
                  top: -20.h, // Positioning above the card
                  child: CircleAvatar(
                    backgroundColor:
                        Colors.orange, // Background color of the inner circle
                    radius: 20.r, // Inner circle radius
                    backgroundImage:
                        AssetImage(imagePath), // Load image for inner circle
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
