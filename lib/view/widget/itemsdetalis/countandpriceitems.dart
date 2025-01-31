import 'package:qaisystore/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CountAndPrice extends StatelessWidget {
  final String count;
  final String price;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CountAndPrice(
      {super.key,
      required this.count,
      required this.price,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          price,
          style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: "sans",
              fontSize: 24,
              height: 1.1),
        ),
        const Spacer(),
        Container(
          color: AppColors.grey.withOpacity(0.2),
          padding: const EdgeInsets.all(4),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: TextDirection.ltr,
            children: [
              Container(
                height: 37,
                width: 60,
                alignment: Alignment.topCenter,
                child: IconButton(
                    onPressed: onRemove,
                    icon: const Icon(
                      Icons.remove,
                      color: AppColors.black,
                    )),
              ),
              Container(
                width: 50,
                height: 38.3,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  count,
                  style: const TextStyle(
                      fontSize: 20, height: 1.1, fontFamily: 'sans'),
                ),
              ),
              SizedBox(
                height: 40,
                width: 60,
                child: IconButton(
                    onPressed: onAdd,
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.black,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
