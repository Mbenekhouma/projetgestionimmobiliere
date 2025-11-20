import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final TabController tabController;

  const LoginForm({super.key, required this.tabController});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
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
          const Icon(Icons.person, color: mainColor, size: 80),
          const SizedBox(height: 20),
          const Text(
            "Connexion à SenImmo",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),
          const SizedBox(height: 30),

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
          const SizedBox(height: 20),

          TextField(
            controller: passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: "Mot de passe",
              prefixIcon: const Icon(Icons.lock_outline, color: mainColor),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: mainColor,
                ),
                onPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: mainColor.withOpacity(0.05),
            ),
          ),
          const SizedBox(height: 20),

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
                "Se connecter",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),

          TextButton(
            onPressed: () {
              widget.tabController.animateTo(1);
            },
            child: const Text(
              "Pas de compte ? S'inscrire",
              style: TextStyle(color: mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
