import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_app/feature/main/presentation/cubit/navigation_cubit.dart';
import 'package:showcase_app/feature/main/presentation/widget/bottom_tab_bar.dart';
import 'package:showcase_app/feature/posts/domain/use_case/get_posts_use_case.dart';
import 'package:showcase_app/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:showcase_app/feature/posts/presentation/screen/posts_screen.dart';
import 'package:showcase_app/feature/profile/presentation/screen/profile_screen.dart';
import 'package:showcase_app/injection/injection.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  static const _bottomBarTabCount = 2;
  late TabController _tabController;
  var _tabSelectedIndex = 0;

  final List<Widget> _screens = const [
    PostsScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _tabController = TabController(length: _bottomBarTabCount, vsync: this);
    //todo check if needed
    context.read<NavigationCubit>().selectFirstTab();
  }

  void _setIndex(int index) {
    if (index != _tabSelectedIndex) {
      context.read<NavigationCubit>().selectTab(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _bottomBarTabCount,
      child: BlocProvider(
        create: (_) => PostsCubit(
          getPostsUseCase: getIt.get<GetPostsUseCase>(),
        )..fetchPosts(),
        child: Scaffold(
          body: Center(
            child: BlocListener<NavigationCubit, NavigationState>(
              // bloc: inject<NavigationCubit>(),
              listener: (context, state) {
                setState(() {
                  _tabSelectedIndex = state.index;
                  _tabController.animateTo(state.index);
                });
              },
              child: _screens[_tabSelectedIndex],
            ),
          ),
          bottomNavigationBar: BottomTabBar(
            onPageChanged: _setIndex,
            tabController: _tabController,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    super.dispose();
  }
}
