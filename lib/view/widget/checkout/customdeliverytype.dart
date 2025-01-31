import 'package:flutter/material.dart';
import 'package:qaisystore/core/constant/colors.dart';

class CustomDeliveryTypeCheckout extends StatelessWidget {
  final String imagename;
  final String title;
  final bool? isactiv;

  const CustomDeliveryTypeCheckout(
      {super.key, required this.imagename, required this.title, this.isactiv});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: isactiv! ? AppColors.thirdColor : Colors.white,
          child: Image.asset(width: 90, imagename),
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.grey3),
        ),
      ],
    );
  }
}
