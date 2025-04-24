import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotifyclone/core/helper/is_dark_mode.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;

  final bool? obscureText;
  final Widget? suffixIcon;

  const CommonTextField({
    super.key,
    this.hintText,
    this.controller,

    this.obscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        obscureText: obscureText ?? false,
        controller: controller,
        style: TextStyle(
          color: context.isDarkMode ? Colors.white : Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 27.0, horizontal: 29.0).r,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30).r,
            borderSide: BorderSide(
              color: Color(0xffA7A7A7),
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffA7A7A7),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(30).r,
          ),
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
