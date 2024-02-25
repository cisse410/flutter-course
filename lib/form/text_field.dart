import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.inputType,
  });

  final TextEditingController controller;
  final String labelText;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.teal,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.teal,
            ),
          ),
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.teal,
          ),
          suffixIcon: IconButton(
            onPressed: controller.clear,
            icon: const Icon(Icons.clear),
          )),
      keyboardType: inputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ce champ est obligatoire';
        }
        return null;
      },
    );
  }
}
