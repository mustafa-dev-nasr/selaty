import 'package:flutter/material.dart';

class OnboardingInfo {
  final String title;
  final String description;
  final String image;
  final Color textColor;
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color backgroundColor3;

  OnboardingInfo(
      {required this.textColor,
      required this.backgroundColor1,
      required this.backgroundColor2,
      required this.backgroundColor3,
      required this.title,
      required this.description,
      required this.image});
}
