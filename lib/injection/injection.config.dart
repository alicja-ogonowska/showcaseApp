// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../base/data/http/app_http_client.dart' as _i3;
import '../feature/posts/data/repository/posts_repository_impl.dart' as _i16;
import '../feature/posts/data/source/posts_data_source.dart' as _i13;
import '../feature/posts/data/source/posts_rest_data_source.dart' as _i14;
import '../feature/posts/domain/repository/posts_repository.dart' as _i15;
import '../feature/posts/domain/use_case/add_post_use_case.dart' as _i17;
import '../feature/posts/domain/use_case/get_posts_use_case.dart' as _i18;
import '../feature/profile/data/repository/user_repository_impl.dart' as _i9;
import '../feature/profile/data/source/user_data_source.dart' as _i6;
import '../feature/profile/data/source/user_data_source_impl.dart' as _i7;
import '../feature/profile/domain/repository/user_repository.dart' as _i8;
import '../feature/profile/domain/use_case/check_authenticated_user_use_case.dart'
    as _i10;
import '../feature/profile/domain/use_case/login_use_case.dart' as _i11;
import '../feature/profile/domain/use_case/logout_use_case.dart' as _i12;
import 'modules/env_module.dart' as _i22;
import 'modules/http_module.dart' as _i21;
import 'modules/logger_module.dart' as _i19;
import 'modules/shared_prefs_module.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final loggerModule = _$LoggerModule();
  final sharedPrefsModule = _$SharedPrefsModule();
  final httpModule = _$HttpModule();
  final envModule = _$EnvModule();
  gh.singleton<_i3.AppHttpClient>(_i3.AppHttpClient());
  gh.factory<_i4.Logger>(() => loggerModule.getLogger());
  await gh.factoryAsync<_i5.SharedPreferences>(
      () => sharedPrefsModule.getSharedPreferences(),
      preResolve: true);
  gh.factory<String>(() => httpModule.baseUrl(), instanceName: 'baseUrl');
  gh.factory<String>(() => envModule.apiKey(), instanceName: 'apiKey');
  gh.factory<_i6.UserDataSource>(() =>
      _i7.UserDataSourceImpl(sharedPreferences: get<_i5.SharedPreferences>()));
  gh.factory<_i8.UserRepository>(() => _i9.UserRepositoryImpl(
      dataSource: get<_i6.UserDataSource>(), logger: get<_i4.Logger>()));
  gh.factory<int>(() => envModule.userId(), instanceName: 'userId');
  gh.factory<_i10.CheckAuthenticatedUserUseCase>(() =>
      _i10.CheckAuthenticatedUserUseCase(
          repository: get<_i8.UserRepository>()));
  gh.factory<_i11.LoginUseCase>(
      () => _i11.LoginUseCase(repository: get<_i8.UserRepository>()));
  gh.factory<_i12.LogoutUseCase>(
      () => _i12.LogoutUseCase(repository: get<_i8.UserRepository>()));
  gh.factory<_i13.PostsDataSource>(() => _i14.PostsRestDataSource(
      appHttpClient: get<_i3.AppHttpClient>(),
      url: get<String>(instanceName: 'baseUrl'),
      apiKey: get<String>(instanceName: 'apiKey'),
      userId: get<int>(instanceName: 'userId')));
  gh.factory<_i15.PostsRepository>(() => _i16.PostsRepositoryImpl(
      dataSource: get<_i13.PostsDataSource>(), logger: get<_i4.Logger>()));
  gh.factory<_i17.AddPostUseCase>(
      () => _i17.AddPostUseCase(repository: get<_i15.PostsRepository>()));
  gh.factory<_i18.GetPostsUseCase>(
      () => _i18.GetPostsUseCase(repository: get<_i15.PostsRepository>()));
  return get;
}

class _$LoggerModule extends _i19.LoggerModule {}

class _$SharedPrefsModule extends _i20.SharedPrefsModule {}

class _$HttpModule extends _i21.HttpModule {}

class _$EnvModule extends _i22.EnvModule {}
