import 'package:flutter/material.dart';
import 'package:flutter_app/model/user.dart';

class SubmitButton extends StatefulWidget {
const SubmitButton({super.key});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  void _submit() {
    var isValid = false;
    var form = formKey.currentState;
    if (form != null) {
      isValid = form.validate();
    }
    if (isValid) {
      User user = User(
          nom: nomController.text,
          prenom: prenomController.text,
          email: emailController.text,
          password: passwordController.text);
      print("Nom: ${user.nom}\nPrenom: ${user.prenom}\nEmail: ${user.email}\n");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _submit,
      child: const Text(
        'Envoyer',
        style: TextStyle(
          fontSize: 30,
          color: Colors.teal,
        ),
      ),
    );
  }
}