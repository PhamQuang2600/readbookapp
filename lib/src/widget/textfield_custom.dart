import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String iconName;
  final String error;
  const TextFieldCustom(
      {required this.controller,
      required this.iconName,
      required this.error,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
        errorText: error.isNotEmpty ? error : null,
        prefixIcon: iconName == 'Name'
            ? const Icon(
                Icons.abc,
                color: Colors.black54,
              )
            : iconName == 'Email'
                ? const Icon(
                    Icons.email,
                    color: Colors.black54,
                  )
                : const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black54,
                  ),
        hintText: iconName,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
