import 'package:dating_app/widgets/app_button.dart';
import 'package:flutter/material.dart';

class SignupEmailPage extends StatelessWidget {
  const SignupEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final email = TextEditingController();
    final pass = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up with email')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(controller: name, decoration: const InputDecoration(labelText: 'Full name')),
            const SizedBox(height: 12),
            TextField(controller: email, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(labelText: 'Email address')),
            const SizedBox(height: 12),
            TextField(controller: pass, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 20),
            AppButton(label: 'Create account', onPressed: () {}, icon: Icons.person_add),
          ],
        ),
      ),
    );
  }
}
