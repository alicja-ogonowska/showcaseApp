import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlashBar<T> {
  const FlashBar({
    required this.message,
    required this.backgroundColor,
    Duration? duration,
  }) : duration = duration ?? const Duration(seconds: 3);

  factory FlashBar.success({
    required String message,
    Duration? duration,
  }) =>
      FlashBar(
        backgroundColor: Colors.lightGreen.shade50,
        message: message,
        duration: duration,
      );

  factory FlashBar.error({
    required String message,
    Duration? duration,
  }) =>
      FlashBar(
        backgroundColor: Colors.red.shade50,
        message: message,
        duration: duration,
      );
  final String message;
  final Color backgroundColor;
  final Duration duration;

  Future<T?> show(BuildContext context) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return Flash(
          controller: controller,
          position: FlashPosition.top,
          behavior: FlashBehavior.floating,
          backgroundColor: backgroundColor,
          borderRadius: BorderRadius.circular(3),
          boxShadows: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 4),
              blurRadius: 40,
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: controller.dismiss,
                  child: const Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
