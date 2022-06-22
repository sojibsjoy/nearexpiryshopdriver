import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget loginTopImg(String img) {
  return SizedBox(
    height: 326,
    width: double.infinity,
    child: Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            img,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 55,
            left: 20,
          ),
          child: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
        )
      ],
    ),
  );
}
