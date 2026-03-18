import 'package:brand_admin/src/core/service/injectable/injectable_service.dart';
import 'package:brand_admin/src/core/service/storage/flutter_secure_storage.dart';
import 'package:brand_admin/src/features/auth/domain/usecases/login_admin_use_case.dart';
import 'package:brand_admin/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:brand_admin/src/features/main/domain/usecases/service_use_case.dart';
import 'package:brand_admin/src/features/main/presentation/bloc/services_bloc.dart';



void manualRegisterServices() {
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      getIt<LoginAdminUseCase>(),
    ),
  );

  getIt.registerFactory<ServicesBloc>(
    () => ServicesBloc(
      getIt<GetSubjectsUseCase>(),
      getIt<GetGradesUseCase>(),
      getIt<GetChaptersUseCase>(),
      getIt<GetLessonsUseCase>(),
      getIt<GetGroupsUseCase>(),
      getIt<GetTasksUseCase>(),
    ),
  );

  getIt.registerSingleton<FlutterSecureStorageWeb>(FlutterSecureStorageWeb());
}
