import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_speat/components/textfield.dart';
import 'package:app_speat/components/button.dart';
import 'package:app_speat/components/square_tile.dart';
import 'package:app_speat/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final firstNameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFFF48C06)),
          );
        });

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        await FirebaseFirestore.instance.collection("users").add({
          "first name": firstNameController.text,
          "name": nameController.text,
          "email": emailController.text
        });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text("Les mots de passe ne correspondent pas."),
              );
            });
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      authErrorMessage(e.code);
    }
  }

  void authErrorMessage(String error) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Échec de l'inscription"),
            content: Text(error),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  "assets/images/speat.png",
                  height: 100,
                ),
                const SizedBox(height: 50),
                Text(
                  "Créez votre compte Speat !",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: firstNameController,
                  hintText: "Prénom",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: nameController,
                  hintText: "Nom",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  hintText: "E-mail",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: "Mot de passe",
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirmer le mot de passe",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyButton(onTap: signUserUp, text: "S'inscrire"),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Ou continuer avec",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: "assets/images/google.png"),
                ]),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Déjà membre?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Se connecter",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
