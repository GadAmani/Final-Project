import 'package:dating_app/widgets/app_button.dart';
import 'package:flutter/material.dart';

class SelectGenderPage extends StatefulWidget {
  const SelectGenderPage({super.key});
  @override
  State<SelectGenderPage> createState() => _SelectGenderPageState();
}

class _SelectGenderPageState extends State<SelectGenderPage> {
  String? _gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select your gender')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _GenderTile(
              label: 'Female',
              selected: _gender == 'female',
              onTap: () => setState(() => _gender = 'female'),
            ),
            const SizedBox(height: 12),
            _GenderTile(
              label: 'Male',
              selected: _gender == 'male',
              onTap: () => setState(() => _gender = 'male'),
            ),
            const SizedBox(height: 12),
            _GenderTile(
              label: 'Other',
              selected: _gender == 'other',
              onTap: () => setState(() => _gender = 'other'),
            ),
            const Spacer(),
            AppButton(label: 'Continue', onPressed: _gender == null ? null : () {}, icon: Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}

class _GenderTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _GenderTile({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: selected ? cs.primary : const Color(0xFFE6E6EA), width: selected ? 2 : 1),
        ),
        child: Row(
          children: [
            Icon(selected ? Icons.radio_button_checked : Icons.radio_button_unchecked, color: selected ? cs.primary : null),
            const SizedBox(width: 12),
            Text(label, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
