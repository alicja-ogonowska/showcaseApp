// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;

import '../base/data/http/app_http_client.dart' as _i3;
import '../feature/posts/data/repository/posts_repository_impl.dart' as _i8;
import '../feature/posts/data/source/posts_data_source.dart' as _i5;
import '../feature/posts/data/source/posts_rest_data_source.dart' as _i6;
import '../feature/posts/domain/repository/posts_repository.dart' as _i7;
import '../feature/posts/domain/use_case/get_posts_use_case.dart' as _i9;
import 'modules/http_module.dart' as _i11;
import 'modules/logger_module.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final loggerModule = _$LoggerModule();
  final httpModule = _$HttpModule();
  gh.singleton<_i3.AppHttpClient>(_i3.AppHttpClient());
  gh.factory<_i4.Logger>(() => loggerModule.getLogger());
  gh.factory<String>(() => httpModule.baseUrl(), instanceName: 'baseUrl');
  gh.factory<_i5.PostsDataSource>(() => _i6.PostsRestDataSource(
      appHttpClient: get<_i3.AppHttpClient>(),
      url: get<String>(instanceName: 'baseUrl')));
  gh.factory<_i7.PostsRepository>(() => _i8.PostsRepositoryImpl(
      dataSource: get<_i5.PostsDataSource>(), logger: get<_i4.Logger>()));
  gh.factory<_i9.GetPostsUseCase>(
      () => _i9.GetPostsUseCase(repository: get<_i7.PostsRepository>()));
  return get;
}

class _$LoggerModule extends _i10.LoggerModule {}

class _$HttpModule extends _i11.HttpModule {}
