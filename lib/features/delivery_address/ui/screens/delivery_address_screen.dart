import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/routing/route.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_icon_bar.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  _DeliveryAddressScreenState createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  final List<Map<String, String>> addresses = [
    {
      'title': 'المنزل',
      'address': '5 - 2 السيد عبد الحميد - ش دنشواى\nشبين الكوم - المنوفيه',
      'phone': '01067859354',
    },
    {
      'title': 'المنزل',
      'address': '5 - 2 السيد عبد الحميد - ش دنشواى\nشبين الكوم - المنوفيه',
      'phone': '01067859354',
    },
    {
      'title': 'العمل',
      'address': '12 - شارع الحرية، المعادي\nالقاهرة',
      'phone': '01234567890',
    },
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    // Check if the device is in portrait or landscape mode
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgrond,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 20.w,
            right: 20.w,
          ),
          child: CustomScrollView(
            slivers: [
              // Header with Icons and Title
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconBar(icon: Icons.camera_alt_outlined),
                    Text("عنوان التسليم", style: AppTextStyles.font20BlackBold),
                    CustomIconBar(
                      icon: Icons.arrow_forward_ios_outlined,
                      onPressed: () => context.pop(),
                    ),
                  ],
                ),
              ),

              // Address List for Portrait and Landscape
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                sliver:
                    isPortrait ? BuildPortraitLayout() : BuildLandscapeLayout(),
              ),

              // Bottom Button
              SliverPadding(
                padding: EdgeInsets.only(bottom: 20.h),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                        child: AppTextButton(
                          backgroundColor: AppColors.softGreen,
                          onPressed: () {
                            context.pushNamed(Routes.arrangeTracks);
                          },
                          buttonText: "أبدأ التسوق",
                          textStyle: isPortrait
                              ? AppTextStyles.font22WhiteMedium
                              : AppTextStyles.font12BlackRegular
                                  .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Portrait Layout: Uses a shorter card height
  SliverList BuildPortraitLayout() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: isSelected ? 4 : 1,
                    child: Padding(
                      padding: EdgeInsets.all(16.0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(flex: 2),
                          Row(
                            children: [
                              Icon(
                                isSelected
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off,
                                color: isSelected ? Colors.red : Colors.grey,
                              ),
                              10.horizontalSpace,
                              Text(
                                addresses[index]["title"]!,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.sentiment_very_satisfied_sharp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            addresses[index]["address"]!,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "جوال: ${addresses[index]["phone"]!}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(flex: 1),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5.h,
                  right: 20.w,
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 14.w, right: 14.w, bottom: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "أفتراضي",
                        style: TextStyle(
                          color: Colors.green[700],
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: addresses.length,
      ),
    );
  }

  SliverToBoxAdapter BuildLandscapeLayout() {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            addresses.length,
            (index) {
              bool isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: MediaQuery.of(context).size.height / 1.4,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: isSelected ? 4 : 1,
                        child: Padding(
                          padding: EdgeInsets.all(16.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(flex: 2),
                              Row(
                                children: [
                                  Icon(
                                    isSelected
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_off,
                                    color:
                                        isSelected ? Colors.red : Colors.grey,
                                  ),
                                  10.horizontalSpace,
                                  Text(
                                    addresses[index]["title"]!,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.sentiment_very_satisfied_sharp,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                addresses[index]["address"]!,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "جوال: ${addresses[index]["phone"]!}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Spacer(flex: 1),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5.h,
                      right: 20.w,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 14.w, right: 14.w, bottom: 8.h),
                        decoration: BoxDecoration(
                          color: AppColors.lightGreen,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.r),
                            bottomRight: Radius.circular(8.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "أفتراضي",
                            style: TextStyle(
                              color: Colors.green[700],
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
