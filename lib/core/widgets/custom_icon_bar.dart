import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconBar extends StatelessWidget {
  CustomIconBar({
    super.key,
    this.onPressed,
    required this.icon,
  });
  final IconData icon;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 45.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: Colors.black)),)
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Center(
            child: Icon(
              icon,
              color: Colors.black,
            ),
          )),
    );
  }
}
