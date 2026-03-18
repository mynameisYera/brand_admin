// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/auth/data/datasource/local/auth_local_impl.dart'
    as _i987;
import '../../../features/auth/data/datasource/local/i_auth_local.dart' as _i90;
import '../../../features/auth/data/datasource/remote/auth_remote_impl.dart'
    as _i262;
import '../../../features/auth/data/datasource/remote/i_auth_remote.dart'
    as _i685;
import '../../../features/auth/data/repository/auth_repository_impl.dart'
    as _i67;
import '../../../features/auth/domain/repository/i_auth_repository.dart'
    as _i1024;
import '../../../features/auth/domain/usecases/login_admin_use_case.dart'
    as _i1032;
import '../../../features/main/data/datasource/remote/i_service_remote.dart'
    as _i895;
import '../../../features/main/data/datasource/remote/service_remote_impl.dart'
    as _i414;
import '../../../features/main/data/repository/service_repository_impl.dart'
    as _i229;
import '../../../features/main/domain/repository/i_service_repository.dart'
    as _i558;
import '../../../features/main/domain/usecases/service_use_case.dart' as _i893;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i90.IAuthLocal>(
      () => _i987.AuthLocalImpl(),
      instanceName: 'AuthLocalImpl',
    );
    gh.lazySingleton<_i895.IServiceRemote>(
      () => _i414.ServiceRemoteImpl(),
      instanceName: 'ServiceRemoteImpl',
    );
    gh.lazySingleton<_i685.IAuthRemote>(
      () => _i262.AuthRemoteImpl(),
      instanceName: 'AuthRemoteImpl',
    );
    gh.lazySingleton<_i1024.IAuthRepo>(
      () => _i67.AuthRepoImpl(
        gh<_i685.IAuthRemote>(instanceName: 'AuthRemoteImpl'),
        gh<_i90.IAuthLocal>(instanceName: 'AuthLocalImpl'),
      ),
      instanceName: 'AuthRepoImpl',
    );
    gh.lazySingleton<_i1032.LoginAdminUseCase>(
      () => _i1032.LoginAdminUseCase(
        gh<_i1024.IAuthRepo>(instanceName: 'AuthRepoImpl'),
      ),
    );
    gh.lazySingleton<_i558.IServiceRepo>(
      () => _i229.ServiceRepoImpl(
        gh<_i895.IServiceRemote>(instanceName: 'ServiceRemoteImpl'),
      ),
      instanceName: 'ServiceRepoImpl',
    );
    gh.lazySingleton<_i893.GetSubjectsUseCase>(
      () => _i893.GetSubjectsUseCase(
        gh<_i558.IServiceRepo>(instanceName: 'ServiceRepoImpl'),
      ),
    );
    gh.lazySingleton<_i893.GetGradesUseCase>(
      () => _i893.GetGradesUseCase(
        gh<_i558.IServiceRepo>(instanceName: 'ServiceRepoImpl'),
      ),
    );
    gh.lazySingleton<_i893.GetChaptersUseCase>(
      () => _i893.GetChaptersUseCase(
        gh<_i558.IServiceRepo>(instanceName: 'ServiceRepoImpl'),
      ),
    );
    gh.lazySingleton<_i893.GetLessonsUseCase>(
      () => _i893.GetLessonsUseCase(
        gh<_i558.IServiceRepo>(instanceName: 'ServiceRepoImpl'),
      ),
    );
    gh.lazySingleton<_i893.GetGroupsUseCase>(
      () => _i893.GetGroupsUseCase(
        gh<_i558.IServiceRepo>(instanceName: 'ServiceRepoImpl'),
      ),
    );
    gh.lazySingleton<_i893.GetTasksUseCase>(
      () => _i893.GetTasksUseCase(
        gh<_i558.IServiceRepo>(instanceName: 'ServiceRepoImpl'),
      ),
    );
    return this;
  }
}
