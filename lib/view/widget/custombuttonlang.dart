import 'package:qaisystore/core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final Function() onPressed;

  const CustomButtonLang(
      {super.key, required this.textbutton, required this.onPressed});
  @override
  Widget build(Object context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        width: double.infinity,
        child: MaterialButton(
          color: AppColors.primaryColor,
          textColor: Colors.white,
          onPressed: onPressed,
          child: Text(
            textbutton,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
