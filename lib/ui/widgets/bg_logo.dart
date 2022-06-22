import 'package:flutter/material.dart';

Widget buildLogoBG(double x, double y) {
  return Transform.translate(
    offset: Offset(x, y),
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/logo_shadow.png'),
        ),
      ),
    ),
  );
}
