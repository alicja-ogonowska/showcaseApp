import 'package:flutter/material.dart';
import 'package:showcase_app/feature/posts/domain/entity/post.dart';
import 'package:showcase_app/l10n/l10n.dart';

class PostOfTheDay extends StatelessWidget {
  const PostOfTheDay({super.key, this.post});

  final Post? post;

  @override
  Widget build(BuildContext context) {
    if (post == null) {
      return const SizedBox.shrink();
    } else {
      const whiteTextStyle = TextStyle(
        color: Colors.white,
      );
      return Padding(
        padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 16,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.postOfTheDayTitle,
                      style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '🏅',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  post!.title,
                  style: whiteTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  post!.body,
                  style: whiteTextStyle,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
