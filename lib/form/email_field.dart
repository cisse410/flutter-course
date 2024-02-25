import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField(
      {super.key,
      required this.controller,
      required this.emailLabel,
      required this.inputType});

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
      cursorColor: Colors.teal,
      decoration: InputDecoration(
          labelText: widget.emailLabel,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          hintText: 'quoifaireavec@gmail.com',
          hintStyle:
              const TextStyle(color: Color.fromRGBO(175, 175, 175, 0.986)),
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
            Icons.email,
            color: Colors.teal,
          ),
          suffixIcon: IconButton(
              onPressed: widget.controller.clear,
              icon: const Icon(Icons.clear))),
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
