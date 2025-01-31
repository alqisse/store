import 'package:flutter/material.dart';
import 'package:qaisystore/core/constant/colors.dart';

class CustomButtonButomAppBar extends StatelessWidget {
  final String? textbutton;
  final IconData iconbutton;
  final void Function()? onPressed;
  final bool? active;
  const CustomButtonButomAppBar(
      {super.key,
      this.textbutton,
      required this.iconbutton,
      this.onPressed,
      this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: active! ? Colors.white : null,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        height: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconbutton,
              color: active! ? AppColors.primaryColor : Colors.white,
              size: 30,
            ),
            Text(
              textbutton!,
              style: TextStyle(
                color: active! ? AppColors.primaryColor : Colors.white,
                // fontSize: 16,
                height: 1,
              ),
            ),
            // active!
            //     ? const Icon(
            //         Icons.arrow_drop_down,
            //         size: 20,
            //         color: AppColors.primaryColor,
            //       )
            //     : const SizedBox()
          ],
        ),
      ),
    );
  }
}
