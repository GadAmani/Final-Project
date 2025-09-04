import 'package:dating_app/widgets/app_button.dart';
import 'package:flutter/material.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final about = TextEditingController();
    DateTime? birthday;

    return Scaffold(
      appBar: AppBar(title: const Text('My profile details')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(controller: name, decoration: const InputDecoration(labelText: 'Display name')),
            const SizedBox(height: 12),
            TextField(controller: about, maxLines: 3, decoration: const InputDecoration(labelText: 'About me (optional)')),
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Birthday'),
              subtitle: Text(birthday == null ? 'Select your birthday' : '${birthday!.year}-${birthday!.month}-${birthday!.day}'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final now = DateTime.now();
                final picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(now.year - 80),
                  lastDate: DateTime(now.year - 18),
                  initialDate: DateTime(now.year - 20),
                );
                if (picked != null) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Picked $picked')));
                }
              },
            ),
            const SizedBox(height: 20),
            AppButton(label: 'Save', onPressed: () {}, icon: Icons.save),
          ],
        ),
      ),
    );
  }
}
