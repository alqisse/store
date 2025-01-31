import 'package:qaisystore/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTextSinUpandSinIn extends StatelessWidget {
  final String textOne;
  final String textTow;
  final void Function() onTap;
  const CustomTextSinUpandSinIn(
      {super.key,
      required this.textOne,
      required this.textTow,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textOne),
        InkWell(
            onTap: onTap,
            child: Text(textTow,
                style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold)))
      ],
    );
  }
}
