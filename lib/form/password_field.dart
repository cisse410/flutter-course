import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {super.key,
      required this.controller,
      required this.passwordLabel,
      required this.inputType});

  final TextEditingController controller;
  final String passwordLabel;
  final TextInputType inputType;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  String password = '';
  String passwordConfirm = '';
  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: Colors.teal,
      decoration: InputDecoration(
        labelText: widget.passwordLabel,
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
          Icons.lock,
          color: Colors.teal,
        ),
        suffixIcon: IconButton(
          onPressed: _togglePasswordView,
          icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off)
        ),
      ),
      keyboardType: widget.inputType,
      obscureText: _isHidden,
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ce champ est obligatoire';
        }
        if (value.length < 8 ||
            !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                .hasMatch(value)) {
          return "Le mot de passe doit etre au moins de 8 caracteres";
        }
        return null;
      },
    );
  }
}
