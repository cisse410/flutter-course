import 'package:flutter/gestures.dart';
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

  User user = User();
  Future<void> _showDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Inscription réussie'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Prénom: ${user.prenom}'),
                Text('Nom: ${user.nom}'),
              ],
            ),
          ),
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 50,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Fermer',
                style: TextStyle(color: Colors.red, fontSize: 17),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.teal, fontSize: 17),
              ),
            ),
          ],
          actionsAlignment: MainAxisAlignment.spaceBetween,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
        );
      },
    );
  }

  void _submit() {
    var isValid = false;
    var form = _formKey.currentState;
    if (form != null) {
      isValid = form.validate();
    }
    if (isValid) {
      user.nom = nomController.text;
      user.prenom = prenomController.text;
      user.email = emailController.text;
      user.password = passwordController.text;
      nomController.clear();
      prenomController.clear();
      emailController.clear();
      passwordController.clear();
      passwordConfirmController.clear();
      _showDialog(context);
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
        dragStartBehavior: DragStartBehavior.start,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/images/logoUIDT.jpeg'),
                  ),
                  const Text(
                    'Formulaire d\'inscription',
                    style: TextStyle(
                      fontSize: 27,
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(MediaQuery.of(context).size.height, 50),
                    ),
                    // style: ButtonStyle(
                    //   backgroundColor: MaterialStateProperty.all(Colors.teal),
                    // ),
                    child: const Text(
                      'Inscrire',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
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
