import 'package:dating_app/widgets/app_button.dart';
import 'package:flutter/material.dart';

class SignupPhonePage extends StatelessWidget {
  const SignupPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final phone = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up with phone')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: phone, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Phone number', prefixText: '+')),
            const SizedBox(height: 16),
            AppButton(label: 'Send code', onPressed: () {}, icon: Icons.send),
          ],
        ),
      ),
    );
  }
}
