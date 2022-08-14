import 'package:flutter/material.dart';

class AddPostsButton extends StatelessWidget {
  const AddPostsButton({super.key, required this.onClick});

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        primary: Colors.deepOrangeAccent,
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
