import 'package:flutter/material.dart';

class CustomAppBarHome extends StatelessWidget {
  final String hinttext;
  final Widget iconButton;
  final TextEditingController? myController;
  final void Function()? onPressedIcon;
  final void Function()? onPressedPrefxIcon;
  final void Function(String)? onChanged;
  const CustomAppBarHome(
      {super.key,
      required this.hinttext,
      this.onPressedIcon,
      this.onPressedPrefxIcon,
      required this.iconButton,
      required this.myController,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 50,
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: myController,
            onChanged: onChanged,
            decoration: InputDecoration(
                isDense: true,
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: onPressedPrefxIcon,
                ),
                hintText: hinttext,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[200]),
          )),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 60,
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 4),
            // margin:const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200]),
            child: IconButton(
              icon: iconButton,
              onPressed: onPressedIcon,
              iconSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
