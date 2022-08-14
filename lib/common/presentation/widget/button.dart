import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrangeAccent),
        borderRadius: BorderRadius.circular(40),
      ),
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(40),
        color: Colors.deepOrangeAccent,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
