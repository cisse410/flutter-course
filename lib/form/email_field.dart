import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField(
      {super.key, required this.controller, required this.emailLabel, required this.inputType});

  final TextEditingController controller;
  final String emailLabel;
  final TextInputType inputType;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.emailLabel,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.teal,
          ),
        ),
      ),
      keyboardType: widget.inputType,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
          return 'Saisir un mail valide';
        }
        return null;
      },
    );
  }
}
