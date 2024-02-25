import 'package:flutter/material.dart';

class PasswordConfirmation extends StatefulWidget {
  const PasswordConfirmation(
      {super.key,
      required this.controller,
      required this.passwordLabel,
      required this.inputType});

  final TextEditingController controller;
  final String passwordLabel;
  final TextInputType inputType;

  @override
  State<PasswordConfirmation> createState() => _PasswordConfirmationState();
}

class _PasswordConfirmationState extends State<PasswordConfirmation> {
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
        suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
            )),
      ),
      keyboardType: widget.inputType,
      obscureText: true,
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ce champ est obligatoire';
        }
        if (value != password) {
          return "Les mots de passe ne correspondent pas";
        }
        return null;
      },
    );
  }
}
