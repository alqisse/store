import 'package:qaisystore/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 90,
      backgroundColor: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: ClipOval(child: Image.asset(AppImageAsset.logo)),
      ),
    );
  }
}
