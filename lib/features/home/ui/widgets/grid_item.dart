import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridItem extends StatelessWidget {
  final int index;

  const GridItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // Define a list of colors for the grid items
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
    ];

    // Get the current orientation of the device
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    // Calculate a responsive height for each grid item
    double itemHeight = isPortrait
        ? MediaQuery.of(context).size.height / 1 // Portrait layout height
        : MediaQuery.of(context).size.height / 5; // Landscape layout height

    // Calculate item width for better layout in both orientations
    double itemWidth = isPortrait
        ? MediaQuery.of(context).size.width / 3 // Portrait layout width
        : MediaQuery.of(context).size.width / 5; // Landscape layout width

    return Container(
      width: itemWidth, // Adjusted width based on orientation
      decoration: BoxDecoration(
        color: colors[index], // Apply color based on the index
        borderRadius: BorderRadius.circular(10.r), // Responsive border radius
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w), // Add padding for better spacing
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Prevent the column from taking all available space
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center content horizontally
          children: [
            Text(
              'عرض ',
              style: TextStyle(
                color: Colors.white,
                fontSize: isPortrait ? 20.sp : 18.sp, // Responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h), // Adjust vertical space
            Text(
              '40%',
              style: TextStyle(
                color: Colors.white,
                fontSize: isPortrait ? 20.sp : 22.sp, // Responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h), // Adjust vertical space
            Text(
              'خصم',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: isPortrait ? 10.sp : 16.sp, // Responsive font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
