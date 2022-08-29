import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcase_app/app/app.dart';
import 'package:showcase_app/base/data/http/app_http_client.dart';
import 'package:showcase_app/feature/posts/data/repository/posts_repository_impl.dart';
import 'package:showcase_app/feature/posts/data/source/posts_data_source.dart';
import 'package:showcase_app/feature/posts/data/source/posts_rest_data_source.dart';
import 'package:showcase_app/feature/posts/domain/repository/posts_repository.dart';
import 'package:showcase_app/feature/posts/domain/use_case/add_post_use_case.dart';
import 'package:showcase_app/feature/posts/domain/use_case/get_posts_use_case.dart';
import 'package:showcase_app/feature/profile/data/repository/user_repository_impl.dart';
import 'package:showcase_app/feature/profile/data/source/user_data_source.dart';
import 'package:showcase_app/feature/profile/data/source/user_data_source_impl.dart';
import 'package:showcase_app/feature/profile/domain/repository/user_repository.dart';
import 'package:showcase_app/feature/profile/domain/use_case/check_authenticated_user_use_case.dart';
import 'package:showcase_app/feature/profile/domain/use_case/login_use_case.dart';
import 'package:showcase_app/feature/profile/domain/use_case/logout_use_case.dart';
import 'package:showcase_app/injection/injection.dart';

import '../test/util/main_screen_launcher.dart';

Future<void> launchHomeScreen(WidgetTester tester) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = null;
  GoogleFonts.config.allowRuntimeFetching = false;

  const appWidget = App();
  await tester.binding.setSurfaceSize(screenSize);
  await _configureDependencies();
  await tester.pumpWidget(appWidget);
  await tester.pump();

  // Wait for data to load
  await Future.delayed(const Duration(seconds: 2));

  // Update main screen with data
  await tester.pump();
}

Future<void> _configureDependencies() async {
  await getIt.reset();
  await dotenv.load();

  //common
  getIt.registerSingleton<AppHttpClient>(AppHttpClient());
  getIt.registerSingleton<Logger>(Logger());

  //ignore: invalid_use_of_visible_for_testing_member
  SharedPreferences.setMockInitialValues({});
  final sharedPrefs = await SharedPreferences.getInstance();

  //posts
  getIt.registerSingleton<PostsDataSource>(
    PostsRestDataSource(
      userId: int.parse(dotenv.env['USER_ID']!),
      apiKey: dotenv.env['API_KEY'].toString(),
      url: 'https://gorest.co.in/public/v2',
      appHttpClient: getIt(),
    ),
  );
  getIt.registerSingleton<PostsRepository>(
    PostsRepositoryImpl(dataSource: getIt(), logger: getIt()),
  );
  getIt.registerSingleton<GetPostsUseCase>(
    GetPostsUseCase(repository: getIt()),
  );
  getIt.registerSingleton<AddPostUseCase>(
    AddPostUseCase(repository: getIt()),
  );

  //user
  getIt.registerSingleton<UserDataSource>(
    UserDataSourceImpl(sharedPreferences: sharedPrefs),
  );
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(dataSource: getIt(), logger: getIt()),
  );
  getIt.registerSingleton<CheckAuthenticatedUserUseCase>(
    CheckAuthenticatedUserUseCase(repository: getIt()),
  );

  getIt.registerSingleton<LogoutUseCase>(
    LogoutUseCase(repository: getIt()),
  );
  getIt.registerSingleton<LoginUseCase>(
    LoginUseCase(repository: getIt()),
  );
}
