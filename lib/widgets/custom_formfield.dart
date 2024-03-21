import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String? hintText;
  final Icon? suffixicon;
  final TextEditingController? controller;
  const CustomFormField({
    super.key,
    required this.hintText,
    required this.suffixicon,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: suffixicon,
        suffixIconColor: const Color(0xff878CA8),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xff878CA8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xff878CA8)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xff878CA8)),
        ),
      ),
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter your $hintText';
        }
        return null;
      },
    );
  }
}
