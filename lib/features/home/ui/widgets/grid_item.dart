// grid_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridItem extends StatelessWidget {
  final int index;

  const GridItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
    ];

    return Container(
      decoration: BoxDecoration(
        color: colors[index],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Text(
            'عرض ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            '40%',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'خصم',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
