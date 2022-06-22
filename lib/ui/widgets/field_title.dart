import 'package:flutter/material.dart';
import 'package:nearexpiryshopdriver/ui/widgets/helper_widgets.dart';

Widget fieldTitle(String icon, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.asset(
        icon,
        height: 15,
      ),
      addW(5),
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    ],
  );
}
