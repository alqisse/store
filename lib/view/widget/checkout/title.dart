import 'package:flutter/material.dart';
import 'package:qaisystore/core/constant/colors.dart';

class CustomTitleCheckout extends StatelessWidget {
  final String title;
  const CustomTitleCheckout({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor),
    );
  }
}
