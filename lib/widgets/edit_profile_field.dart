import 'package:flutter/material.dart';

class EditProfileField extends StatelessWidget {
  final String title;
  final bool isBio;
  final TextInputType keboardType;
  final TextEditingController controller;

  const EditProfileField({
    super.key,
    required this.title,
    this.isBio = false,
    this.keboardType = TextInputType.name,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              controller: controller,
              keyboardType: keboardType,
              maxLines: isBio ? 2 : 1,
              cursorColor: const Color(0XFF3897F0),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: title,
                hintStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0X413C3C43),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0X213C3C43),
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF3897F0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
