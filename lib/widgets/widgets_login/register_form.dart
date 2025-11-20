import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  final TabController tabController;

  const RegisterForm({super.key, required this.tabController});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final prenomController = TextEditingController();
  final nomController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePass = true;

  @override
  void dispose() {
    prenomController.dispose();
    nomController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Colors.indigo;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Icon(Icons.person_add, color: mainColor, size: 80),
          const SizedBox(height: 20),
          const Text(
            "Créer un compte",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),
          const SizedBox(height: 30),

          TextField(
            controller: prenomController,
            decoration: InputDecoration(
              labelText: "Prénom",
              prefixIcon: const Icon(Icons.person, color: mainColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: mainColor.withOpacity(0.05),
            ),
          ),
          const SizedBox(height: 15),

          TextField(
            controller: nomController,
            decoration: InputDecoration(
              labelText: "Nom",
              prefixIcon: const Icon(Icons.person_outline, color: mainColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: mainColor.withOpacity(0.05),
            ),
          ),
          const SizedBox(height: 15),

          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Adresse e-mail",
              prefixIcon: const Icon(Icons.email_outlined, color: mainColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: mainColor.withOpacity(0.05),
            ),
          ),
          const SizedBox(height: 15),

          TextField(
            controller: passwordController,
            obscureText: _obscurePass,
            decoration: InputDecoration(
              labelText: "Mot de passe",
              prefixIcon: const Icon(Icons.lock_outline, color: mainColor),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePass ? Icons.visibility_off : Icons.visibility,
                  color: mainColor,
                ),
                onPressed: () {
                  setState(() => _obscurePass = !_obscurePass);
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: mainColor.withOpacity(0.05),
            ),
          ),
          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "S'inscrire",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),

          TextButton(
            onPressed: () {
              widget.tabController.animateTo(0);
            },
            child: const Text(
              "Déjà un compte ? Se connecter",
              style: TextStyle(color: mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
