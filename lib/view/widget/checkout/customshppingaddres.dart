import 'package:flutter/material.dart';
import 'package:qaisystore/core/constant/colors.dart';

class CustomShippingAddresCheckout extends StatelessWidget {
  final String title;
  final String body;
  final bool? isactiv;
  const CustomShippingAddresCheckout(
      {super.key, required this.title, required this.body, this.isactiv});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isactiv! ? AppColors.thirdColor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black),
        ),
        subtitle: Text(
          body,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
