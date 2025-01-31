import 'package:qaisystore/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final void Function()? onPressedIcon;
  const CustomAppBar(
      {super.key, required this.onPressedIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: const EdgeInsets.symmetric(horizontal: 5,),
      height: 50,
      // margin:const EdgeInsets.only(bottom: 10),
      // decoration: BoxDecoration(
      //    border: Border.all(color: AppColors.grey)
      // ) ,
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 25,
              ),
              onPressed: onPressedIcon,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
