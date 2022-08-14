import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    this.popStack = false,
  });

  final List<TabItem> tabs;
  final int selectedIndex;
  final bool popStack;

  @override
  TabNavigatorState createState() => TabNavigatorState();
}

class TabNavigatorState extends State<TabNavigator> {
  Future<bool> maybePop() {
    return widget.tabs[widget.selectedIndex].key.currentState!.maybePop();
  }

  Future<void> _popStackIfRequired(BuildContext context) async {
    if (widget.popStack) {
      widget.tabs[widget.selectedIndex].key.currentState!
          .popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    _popStackIfRequired(context);
    return Stack(
      children: List.generate(
        widget.tabs.length,
        (index) {
          return _Tab(
            tabs: widget.tabs,
            selectedIndex: widget.selectedIndex,
            index: index,
          );
        },
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.tabs,
    required this.selectedIndex,
    required this.index,
  });

  final List<TabItem> tabs;
  final int selectedIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: selectedIndex != index,
      child: Opacity(
        opacity: selectedIndex == index ? 1.0 : 0.0,
        child: Navigator(
          key: tabs[index].key,
          onGenerateRoute: (settings) => MaterialPageRoute(
            settings: settings,
            builder: (_) => tabs[index].tab,
          ),
        ),
      ),
    );
  }
}

class TabItem {
  const TabItem(this.key, this.tab);

  final GlobalKey<NavigatorState> key;
  final Widget tab;
}

class TabNavigatorStates {
  TabNavigatorStates()
      : tabNavigator = GlobalKey<TabNavigatorState>(),
        tabPosts = GlobalKey<NavigatorState>(),
        tabProfile = GlobalKey<NavigatorState>();

  final GlobalKey<TabNavigatorState> tabNavigator;
  final GlobalKey<NavigatorState> tabPosts;
  final GlobalKey<NavigatorState> tabProfile;
}
