import 'package:flutter/material.dart';
import 'package:qaisystore/core/constant/colors.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Column(
          children: [
            const Text("Warring"),
            const Divider(),
            const Text("Your not have del"),
            const Divider(),
            Row(
              children: [
                MaterialButton(
                  onPressed: () {},
                  color: AppColors.primaryColor,
                  textColor: Colors.white,
                  child: const Text(
                    "yes",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  color: AppColors.primaryColor,
                  textColor: Colors.white,
                  child: const Text(
                    "No",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
