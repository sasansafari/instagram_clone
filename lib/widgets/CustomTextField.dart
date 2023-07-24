// ignore: file_names
import 'package:flutter/material.dart';
import '../../gen/fonts.gen.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String? hint;
  final bool checkobscure;
  late final Icon? icon;
  

  CustomTextField({
    Key? key,
    required this.hint,
    required this.checkobscure,
  }) : super(key: key) {
    icon = hint != 'Password' ? null : const Icon(Icons.remove_red_eye);
  }

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}




class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(
            // color: Colors.black26,
            fontSize: 14,
            fontFamily: FontFamily.dana,),
        border: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        filled: true,
        fillColor: const Color.fromRGBO(255, 250, 250, 1),
        suffixIcon: widget.icon,
        contentPadding: const EdgeInsets.all(8),
      ),
      obscureText: widget.checkobscure,
    );
  }
}
