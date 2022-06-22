import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController con;
  final String hintTxt;
  const CustomTextField({
    Key? key,
    required this.con,
    required this.hintTxt,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.con,
      keyboardType: TextInputType.number,
      style: const TextStyle(
        fontSize: 13,
      ),
      decoration: InputDecoration(
        hintText: widget.hintTxt,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
