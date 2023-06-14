import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Color? filledColor;
  final bool? filled;
  final IconData? prefixIcon;
  final TextEditingController controller;

  const AppTextField(
      {Key? key,
      required this.hintText,
      this.filledColor,
      this.filled,
      required this.controller, 
      this.prefixIcon,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        // alignLabelWithHint: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        prefixIcon: Icon(prefixIcon),
        filled: filled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        fillColor:filledColor,
      ),
    );
  }
}
