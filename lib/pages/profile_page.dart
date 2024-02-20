import 'package:app_speat/components/button.dart';
import 'package:app_speat/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _emailController.text = currentUser.email ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          const Icon(Icons.person, size: 72),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Adresse e-mail",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: _emailController,
                  hintText: "Entrez votre adresse e-mail",
                  obscureText: false,
                  enabled: _isEmailEditable(),
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap: () async {
                    try {
                      await currentUser
                          .verifyBeforeUpdateEmail(_emailController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Adresse e-mail mise à jour avec succès"),
                        ),
                      );
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Erreur lors de la mise à jour de l'adresse e-mail"),
                        ),
                      );
                    }
                  },
                  text: "Enregistrer",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _isEmailEditable() {
    return currentUser.providerData
        .every((userInfo) => userInfo.providerId != 'google.com');
  }
}
