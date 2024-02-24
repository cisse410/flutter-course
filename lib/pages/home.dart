import 'package:flutter/material.dart';
import 'package:flutter_app/form/email_field.dart';
import 'package:flutter_app/form/password_confimation.dart';
import 'package:flutter_app/form/password_field.dart';
import 'package:flutter_app/form/text_field.dart';
import 'package:flutter_app/model/user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  void _submit() {
    var isValid = false;
    var form = _formKey.currentState;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Les formulaires',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Formulaire avec validation de données',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  FormTextField(
                    controller: prenomController,
                    labelText: 'First name',
                    inputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  FormTextField(
                      controller: nomController,
                      labelText: 'Last name',
                      inputType: TextInputType.text),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  EmailField(
                    controller: emailController,
                    emailLabel: 'Email',
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  PasswordField(
                      controller: passwordController,
                      passwordLabel: 'Password',
                      inputType: TextInputType.text),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  PasswordConfirmation(
                      controller: passwordConfirmController,
                      passwordLabel: 'Confirm password',
                      inputType: TextInputType.text),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  ElevatedButton(
                    onPressed: _submit,
                    child: const Text(
                      'Envoyer',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
