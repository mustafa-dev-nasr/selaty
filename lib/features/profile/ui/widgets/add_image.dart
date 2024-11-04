import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:selaty/core/theming/app_colors.dart';

class AddImage extends StatefulWidget {
  const AddImage({
    super.key,
    this.imagePath,
    required this.onImageSelected,
  });

  final String? imagePath;
  final void Function(String imagePath) onImageSelected;

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  late String? _currentImagePath;

  @override
  void initState() {
    super.initState();
    _currentImagePath = widget.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showImagePickerOptions,
      child: Padding(
        padding: EdgeInsets.all(30.w), // Responsive padding
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Profile Image or Lottie Animation
            SizedBox(
              width: 101.w,
              height: 101.h,
              child: _currentImagePath == null
                  ? CircleAvatar(
                      radius: 80.r, // Responsive avatar radius
                      child: Lottie.asset(
                        'assets/lottie/avatar.json',
                        width: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 120.w
                            : 60.w,
                        height: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 150.h
                            : 100.h,
                        fit: BoxFit.fill,
                      ),
                    )
                  : CircleAvatar(
                      radius: 80.r, // Adjusts to screen size with ScreenUtil
                      backgroundImage: FileImage(File(_currentImagePath!)),
                    ),
            ),
            // Camera or Change Icon
            Positioned(
              bottom: -15.h,
              right: -12.w,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: gray,
                  borderRadius: BorderRadius.circular(34.r),
                ),
                child: IconButton(
                  onPressed: _showImagePickerOptions,
                  icon: Icon(
                    _currentImagePath != null
                        ? Icons.published_with_changes_outlined
                        : Icons.camera_alt,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show Image Picker Dialog
  void _showImagePickerOptions() {
    showGeneralDialog(
      context: context,
      barrierLabel: "Select Image",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            width: 0.8.sw, // 80% of the screen width
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.photo_library, size: 24.sp),
                    title: Text("Choose from gallery",
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () {
                      Navigator.pop(context);
                      _getImageFromGallery();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.camera_alt, size: 24.sp),
                    title: Text("Take a picture",
                        style: TextStyle(fontSize: 16.sp)),
                    onTap: () {
                      Navigator.pop(context);
                      _getImageFromCamera();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _getImageFromGallery() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _currentImagePath = pickedFile.path;
      });
      widget.onImageSelected(pickedFile.path);
    }
  }

  Future<void> _getImageFromCamera() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _currentImagePath = pickedFile.path;
      });
      widget.onImageSelected(pickedFile.path);
    }
  }
}
