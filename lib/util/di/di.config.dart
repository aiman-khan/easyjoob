// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;

import '../../features/auth/data/local/auth_local_datasource.dart' as _i13;
import '../../features/auth/data/local/auth_local_datasource_imp.dart' as _i14;
import '../../features/auth/data/remote/auth_remote_datasource.dart' as _i15;
import '../../features/auth/data/remote/auth_remote_datasource_imp.dart'
    as _i16;
import '../../features/auth/domain/repository/auth_repository.dart' as _i17;
import '../../features/auth/domain/repository/auth_repository_imp.dart' as _i18;
import '../../features/auth/domain/usecases/get_user.dart' as _i19;
import '../../features/auth/domain/usecases/login.dart' as _i26;
import '../../features/auth/domain/usecases/pick_camera_image_usecase.dart'
    as _i11;
import '../../features/auth/domain/usecases/pick_gallery_image_usecase.dart'
    as _i12;
import '../../features/auth/domain/usecases/register.dart' as _i31;
import '../../features/auth/domain/usecases/remove_user.dart' as _i32;
import '../../features/auth/domain/usecases/set_user.dart' as _i34;
import '../../features/auth/domain/usecases/update_user.dart' as _i35;
import '../../features/home/data/local/home_local_datasource.dart' as _i20;
import '../../features/home/data/local/home_local_datasource_imp.dart' as _i21;
import '../../features/home/data/remote/home_remote_datasource.dart' as _i22;
import '../../features/home/data/remote/home_remote_datasource_imp.dart'
    as _i23;
import '../../features/home/domain/repository/home_repository.dart' as _i24;
import '../../features/home/domain/repository/home_repository_imp.dart' as _i25;
import '../../features/onboard/data/local/onboard_local_datasource.dart'
    as _i27;
import '../../features/onboard/data/local/onboard_local_datasource_imp.dart'
    as _i28;
import '../../features/onboard/domain/repository/onboard_repository.dart'
    as _i29;
import '../../features/onboard/domain/repository/onboard_repository_imp.dart'
    as _i30;
import '../../features/onboard/domain/usecases/is_fresh.dart' as _i36;
import '../../features/onboard/domain/usecases/set_unfresh.dart' as _i33;
import '../helpers/image_picker/image_picker_helper.dart' as _i3;
import '../helpers/image_picker/image_picker_helper_impl.dart' as _i4;
import '../helpers/network_call_helper/http_network_call_helper_impl.dart'
    as _i8;
import '../helpers/network_call_helper/network_call_helper.dart' as _i7;
import '../helpers/persistance/persistance_helper.dart' as _i9;
import '../helpers/persistance/persistance_helper_imp.dart' as _i10;
import '../router/middlewares.dart' as _i37;
import 'di.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ImagePickerHelper>(() => _i4.ImagePickerHelperImpl());
    gh.lazySingleton<_i5.Logger>(() => _i6.LoggerImp());
    gh.lazySingleton<_i7.NetworkCallHelper>(
        () => _i8.HttpNetworkCallHelperImpl(logger: gh<_i5.Logger>()));
    gh.singleton<_i9.PersistanceHelper>(_i10.PersistanceHelperImpl());
    gh.lazySingleton<_i11.PickCameraImageUsecase>(
        () => _i11.PickCameraImageUsecase(image: gh<_i3.ImagePickerHelper>()));
    gh.lazySingleton<_i12.PickGalleryImageUsecase>(
        () => _i12.PickGalleryImageUsecase(image: gh<_i3.ImagePickerHelper>()));
    gh.lazySingleton<_i13.AuthLocalDataSource>(
        () => _i14.AuthLocalDataSourceImp(
              logger: gh<_i5.Logger>(),
              persistanceHelper: gh<_i9.PersistanceHelper>(),
            ));
    gh.lazySingleton<_i15.AuthRemoteDataSource>(
        () => _i16.AuthRemoteDataSourceImp(
              logger: gh<_i5.Logger>(),
              networkCallHelper: gh<_i7.NetworkCallHelper>(),
            ));
    gh.lazySingleton<_i17.AuthRepository>(() => _i18.AuthRepositoryImp(
          authRemoteDataSource: gh<_i15.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i13.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i19.GetUserUsecase>(
        () => _i19.GetUserUsecase(authRepository: gh<_i17.AuthRepository>()));
    gh.lazySingleton<_i20.HomeLocalDataSource>(
        () => _i21.HomeLocalDataSourceImp(
              logger: gh<_i5.Logger>(),
              persistanceHelper: gh<_i9.PersistanceHelper>(),
            ));
    gh.lazySingleton<_i22.HomeRemoteDataSource>(
        () => _i23.HomeRemoteDataSourceImp(
              logger: gh<_i5.Logger>(),
              networkCallHelper: gh<_i7.NetworkCallHelper>(),
            ));
    gh.lazySingleton<_i24.HomeRepository>(() => _i25.HomeRepositoryImp(
          homeLocalDataSource: gh<_i20.HomeLocalDataSource>(),
          homeRemoteDataSource: gh<_i22.HomeRemoteDataSource>(),
        ));
    gh.lazySingleton<_i26.LoginUsecase>(
        () => _i26.LoginUsecase(authRepository: gh<_i17.AuthRepository>()));
    gh.lazySingleton<_i27.OnboardLocalDataSource>(
        () => _i28.OnboardLocalDataSourceImp(
              logger: gh<_i5.Logger>(),
              persistanceHelper: gh<_i9.PersistanceHelper>(),
            ));
    gh.lazySingleton<_i29.OnboardRepository>(() => _i30.OnboardRepositoryImp(
        onboardLocalDataSource: gh<_i27.OnboardLocalDataSource>()));
    gh.lazySingleton<_i31.RegisterUsecase>(() =>
        _i31.RegisterUsecase(signUpRepository: gh<_i17.AuthRepository>()));
    gh.lazySingleton<_i32.RemoveUserUsecase>(() =>
        _i32.RemoveUserUsecase(authRepository: gh<_i17.AuthRepository>()));
    gh.lazySingleton<_i33.SetUnfreshUsecase>(() => _i33.SetUnfreshUsecase(
        onboardRepository: gh<_i29.OnboardRepository>()));
    gh.lazySingleton<_i34.SetUserUsecase>(
        () => _i34.SetUserUsecase(authRepository: gh<_i17.AuthRepository>()));
    gh.lazySingleton<_i35.UpdateUserUsecase>(() =>
        _i35.UpdateUserUsecase(authRepository: gh<_i17.AuthRepository>()));
    gh.lazySingleton<_i36.IsFreshUsecase>(() =>
        _i36.IsFreshUsecase(onboardRepository: gh<_i29.OnboardRepository>()));
    gh.lazySingleton<_i37.RouteMiddleWares>(() => _i37.RouteMiddleWares(
        isFreshInstallUsecase: gh<_i36.IsFreshUsecase>()));
    return this;
  }
}
