import 'package:flutter/material.dart';
import 'package:qaisystore/core/constant/colors.dart';

class CustomPaymentMethodeCheckout extends StatelessWidget {
  final String title;
  final bool? isActive;
  final void Function()? onPressed;

  const CustomPaymentMethodeCheckout(
      {super.key, required this.title, this.isActive, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
            color: isActive! ? AppColors.thirdColor : null,
            borderRadius: BorderRadius.circular(30)),
        child: MaterialButton(
          onPressed: onPressed,
          textColor: isActive! ? Colors.white : AppColors.grey3,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
