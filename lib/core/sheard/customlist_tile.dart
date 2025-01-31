import 'package:flutter/material.dart';

class CustomListTaile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String subTitle;
  final String? trealingtextButton;
  final void Function()? onPressedBotton;
  final IconData? trealingicon;
  final Color? coloricon;
  final Color? colortextButton;
  final void Function()? onPressedIcon;

  const CustomListTaile(
      {super.key,
      this.leading,
      required this.title,
      required this.subTitle,
      this.trealingtextButton,
      this.onPressedBotton,
      this.trealingicon,
      this.onPressedIcon,
      this.coloricon,
      this.colortextButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ListTile(
            leading: leading,
            title: Text(title),
            subtitle: Text(subTitle),
          ),
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(top: 12),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: MaterialButton(
                    onPressed: onPressedBotton,
                    child: Text(
                      trealingtextButton == null ? "" : trealingtextButton!,
                      style: TextStyle(color: colortextButton),
                    )),
              ),
              Expanded(
                child: IconButton(
                    onPressed: onPressedIcon,
                    icon: Icon(
                      trealingicon,
                      color: coloricon,
                    )),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
