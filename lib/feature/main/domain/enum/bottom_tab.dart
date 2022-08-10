import 'package:flutter/material.dart';
import 'package:showcase_app/l10n/l10n.dart';

enum BottomTab {
  posts,
  settings;
}

extension BottomTabExtensions on BottomTab {
  String getTitle(BuildContext context) {
    switch (this) {
      case BottomTab.posts:
        return context.l10n.posts;
      case BottomTab.settings:
        return context.l10n.profile;
    }
  }

  IconData getIconData({required bool isSelected}) {
    switch (this) {
      case BottomTab.posts:
        return Icons.article_outlined;
      case BottomTab.settings:
        return isSelected ? Icons.settings : Icons.settings;
    }
  }
}
