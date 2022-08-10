import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_app/feature/main/domain/enum/bottom_tab.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({
    super.key,
    required this.onPageChanged,
    required this.tabController,
  });

  static const double defaultHeight = 70;

  static int get postsIndex => BottomTab.values.indexOf(BottomTab.posts);

  static int get settingsIndex => BottomTab.values.indexOf(BottomTab.settings);

  final ValueChanged<int> onPageChanged;
  final TabController tabController;

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  static const _navigatorIndicatorThickness = 3.0;

  Size get itemSize => Size(
        MediaQuery.of(context).size.width / 2,
        BottomTabBar.defaultHeight + MediaQuery.of(context).padding.bottom,
      );

  late BottomTab _selectedTab;

  @override
  void initState() {
    super.initState();
    _initTabController();
  }

  void _initTabController() {
    _selectedTab = BottomTab.values[widget.tabController.index];
    widget.tabController.addListener(_tabControllerListener);
  }

  void _tabControllerListener() {
    setState(() {
      _selectedTab = BottomTab.values[widget.tabController.index];
    });
  }

  bool isSelected(BottomTab tab) => _selectedTab == tab;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.appBar(context),
      height: itemSize.height,
      child: TabBar(
        onTap: widget.onPageChanged,
        controller: widget.tabController,
        labelPadding: EdgeInsets.zero,
        // labelColor: AppColors.appBar(context),
        // unselectedLabelColor: AppColors.black(context),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: _buildIndicator(),
        tabs: [
          _NavigationTab(
            BottomTab.posts.getIconData(
              isSelected: isSelected(BottomTab.posts),
            ),
            size: itemSize,
            title: BottomTab.posts.getTitle(context),
            isSelected: isSelected(BottomTab.posts),
            //  key: const Key(BottomTabBarKeys.homeButtonKey),
          ),
          _NavigationTab(
            BottomTab.settings.getIconData(
              isSelected: isSelected(BottomTab.settings),
            ),
            size: itemSize,
            title: BottomTab.settings.getTitle(context),
            isSelected: isSelected(BottomTab.settings),
            //  key: const Key(BottomTabBarKeys.homeButtonKey),
          ),
        ],
      ),
    );
  }

  UnderlineTabIndicator _buildIndicator() {
    return UnderlineTabIndicator(
      borderSide: BorderSide(
        //  color: AppColors.intenseRed(context),
        width: _navigatorIndicatorThickness,
      ),
      insets: EdgeInsets.only(
        bottom: itemSize.height - _navigatorIndicatorThickness,
      ),
    );
  }
}

class _NavigationTab extends StatelessWidget {
  const _NavigationTab(
    this.iconData, {
    Key? key,
    required this.title,
    required this.isSelected,
    required this.size,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final bool isSelected;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: EdgeInsets.only(
          top: 5,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Tab(
          icon: Icon(
            iconData,
            color: isSelected ? Colors.red : Colors.black,
          ),
          child: _TabText(
            isSelected: isSelected,
            title: title,
          ),
        ),
      ),
    );
  }
}

class _TabText extends StatelessWidget {
  const _TabText({
    Key? key,
    required this.isSelected,
    required this.title,
  }) : super(key: key);

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
        style: TextStyle(color:isSelected ? Colors.red : Colors.black)
      // style: isSelected
      //     ? AppStyles.bodyXs(context, color: AppColors.intenseRed(context))
      //         .copyWith(
      //         fontWeight: FontWeight.bold,
      //       )
      //     : AppStyles.bodyXs(context),
    );
  }
}
