// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcase_app/common/presentation/asset_images.dart';
import 'package:showcase_app/feature/main/presentation/cubit/navigation_cubit.dart';
import 'package:showcase_app/feature/main/presentation/screen/main_screen.dart';
import 'package:showcase_app/feature/profile/domain/use_case/check_authenticated_user_use_case.dart';
import 'package:showcase_app/feature/profile/domain/use_case/login_use_case.dart';
import 'package:showcase_app/feature/profile/domain/use_case/logout_use_case.dart';
import 'package:showcase_app/feature/profile/presentation/cubit/user_cubit.dart';
import 'package:showcase_app/injection/injection.dart';
import 'package:showcase_app/l10n/l10n.dart';

class App extends StatefulWidget {
  const App();
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(AssetImages.error), context);
    precacheImage(const AssetImage(AssetImages.postsHeader), context);
    precacheImage(const AssetImage(AssetImages.addPostHeader), context);
    precacheImage(const AssetImage(AssetImages.login), context);
    precacheImage(const AssetImage(AssetImages.welcome), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => NavigationCubit(),
          ),
          BlocProvider(
            create: (_) => UserCubit(
              loginUseCase: getIt.get<LoginUseCase>(),
              logoutUseCase: getIt.get<LogoutUseCase>(),
              checkAuthenticatedUserUseCase:
                  getIt.get<CheckAuthenticatedUserUseCase>(),
            )..checkAuthenticatedUser(),
          ),
        ],
        child: const MainScreen(),
      ),
    );
  }
}
