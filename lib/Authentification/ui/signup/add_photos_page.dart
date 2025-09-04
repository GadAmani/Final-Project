import 'package:dating_app/widgets/app_button.dart';
import 'package:flutter/material.dart';

class AddPhotosPage extends StatelessWidget {
  const AddPhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add photos')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Add up to 6 photos'),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 12, crossAxisSpacing: 12),
                itemCount: 6,
                itemBuilder: (_, i) => _PhotoSlot(index: i + 1),
              ),
            ),
            AppButton(label: 'Continue', onPressed: () {}, icon: Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}

class _PhotoSlot extends StatelessWidget {
  final int index;
  const _PhotoSlot({required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE6E6EA)),
        ),
        child: const Center(child: Icon(Icons.add_a_photo_outlined)),
      ),
    );
  }
}
