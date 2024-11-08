import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selaty/core/helpers/extensions/app_navigotion.dart';
import 'package:selaty/core/widgets/app_text_button.dart';
import 'package:selaty/core/theming/app_colors.dart';
import 'package:selaty/core/theming/app_text_styles.dart';
import 'package:selaty/core/widgets/custom_icon_bar.dart';

import '../../data/models/cart_item_model.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/checkout_summary_widget.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  CardScreenState createState() => CardScreenState();
}

class CardScreenState extends State<CardScreen> {
  final List<CartItem> cartItems = [
    CartItem(name: "كمثري امريكي", price: 35.0),
    CartItem(name: "تفاح احمر", price: 20.0),
    CartItem(name: "موز كافندش", price: 15.0),
  ];

  void _incrementItem(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void _decrementItem(int index) {
    if (cartItems[index].quantity > 0) {
      setState(() {
        cartItems[index].quantity--;
      });
    }
  }

  double get totalCartPrice =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  int get totalItemsCount =>
      cartItems.fold(0, (sum, item) => sum + item.quantity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgrond,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconBar(icon: Icons.camera_alt_outlined),
                Text("عربه التسوق", style: AppTextStyles.font20BlackBold),
                CustomIconBar(
                  icon: Icons.arrow_forward_ios_outlined,
                  onPressed: () => context.pop(),
                ),
              ],
            ),
            20.verticalSpace,
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) => CartItemWidget(
                  item: cartItems[index],
                  onIncrement: () => _incrementItem(index),
                  onDecrement: () => _decrementItem(index),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height /
                  3.5, // Adjust height as needed
              child: CheckoutSummaryWidget(
                itemCount: totalItemsCount,
                subtotal: totalCartPrice,
                total: totalCartPrice,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppTextButton(
                      onPressed: () {},
                      backgroundColor: AppColors.softGreen,
                      buttonText: "الدفع",
                      textStyle: AppTextStyles.font22WhiteMedium,
                    ),
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
