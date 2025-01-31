import 'package:flutter/material.dart';
import 'package:qaisystore/core/constant/colors.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCoupon({Key? key, required this.textbutton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 46,
      color: AppColors.primaryColor,
      textColor: Colors.white,
      onPressed: onPressed,
      child:
          Text(textbutton, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
