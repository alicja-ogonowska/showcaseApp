import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcase_app/app/app.dart';
import 'package:showcase_app/base/data/http/app_http_client.dart';
import 'package:showcase_app/feature/posts/data/repository/posts_repository_impl.dart';
import 'package:showcase_app/feature/posts/data/source/posts_data_source.dart';
import 'package:showcase_app/feature/posts/data/source/posts_rest_data_source.dart';
import 'package:showcase_app/feature/posts/domain/repository/posts_repository.dart';
import 'package:showcase_app/feature/posts/domain/use_case/get_posts_use_case.dart';
import 'package:showcase_app/feature/profile/data/repository/user_repository_impl.dart';
import 'package:showcase_app/feature/profile/data/source/user_data_source.dart';
import 'package:showcase_app/feature/profile/data/source/user_data_source_impl.dart';
import 'package:showcase_app/feature/profile/domain/repository/user_repository.dart';
import 'package:showcase_app/feature/profile/domain/use_case/check_authenticated_user_use_case.dart';
import 'package:showcase_app/feature/profile/domain/use_case/login_use_case.dart';
import 'package:showcase_app/feature/profile/domain/use_case/logout_use_case.dart';
import 'package:showcase_app/injection/injection.dart';

import 'mocks/app_http_client_mock.dart';
import 'mocks/logger_mock.dart';
import 'mocks/mock_server_responses_manager.dart';

Future<Widget> getMainScreenWidget(
  WidgetTester tester, {
  bool loggedIn = false,
}) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await _configureTestDependencies();
  return const App();
}

Future<void> _configureTestDependencies() async {
  SharedPreferences.setMockInitialValues({});
  await getIt.reset();
  MockServerResponsesManager().clearAll();

  //common
  getIt.registerSingleton<AppHttpClient>(AppHttpClientMock());
  getIt.registerSingleton<Logger>(LoggerMock());
  final sharedPrefs = await SharedPreferences.getInstance();

  //posts
  getIt.registerSingleton<PostsDataSource>(
    PostsRestDataSource(
      userId: 123,
      apiKey: 'api_key',
      url: ApiService.postsDataSource.toString(),
      appHttpClient: getIt(),
    ),
  );
  getIt.registerSingleton<PostsRepository>(
    PostsRepositoryImpl(dataSource: getIt(), logger: getIt()),
  );
  getIt.registerSingleton<GetPostsUseCase>(
    GetPostsUseCase(repository: getIt()),
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

Future<void> launchTab(WidgetTester tester, Widget widget, TabName tab) async {
  await tester.pumpWidget(widget);
  await tester.pump();
  await waitForAnimation(tester);

  await selectTab(tester, tab);
}

Future<void> selectTab(WidgetTester tester, TabName tab) async {
  await tester.tap(find.text(tab.getDisplayName()));
  await tester.pump();

  await waitForAnimation(tester);

  await tester.pump();
}

Future<void> waitForAnimation(WidgetTester tester) async {
  return tester.pump(const Duration(milliseconds: 500));
}

enum TabName { posts, profile }

extension TabNameExt on TabName {
  String getDisplayName() {
    switch (this) {
      case TabName.posts:
        return 'Posts';
      case TabName.profile:
        return 'Profile';
    }
  }
}
