import 'auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../../data/remote/auth_remote_datasource.dart';
import '../usecases/register.dart';
import '../usecases/login.dart';
import '../../data/local/auth_local_datasource.dart';
import '../usecases/get_user.dart';
import '../usecases/set_user.dart';
import '../usecases/update_user.dart';
import '../usecases/remove_user.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImp({
    required AuthRemoteDataSource authRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
  })  : _authRemoteDataSource = authRemoteDataSource,
        _authLocalDataSource = authLocalDataSource;

  /// [RegisterUsecaseInput] is received to [register] method as parameter
  /// [RegisterUsecaseOutput] is returned from [register] method
  @override
  Future<RegisterUsecaseOutput> register(RegisterUsecaseInput input) async {
    return _authRemoteDataSource.register(input);
  }

  /// [LoginUsecaseInput] is received to [login] method as parameter
  /// [LoginUsecaseOutput] is returned from [login] method
  @override
  Future<LoginUsecaseOutput> login(LoginUsecaseInput input) async {
    return _authRemoteDataSource.login(input);
  }

  /// [GetUserUsecaseInput] is received to [getUser] method as parameter
  /// [GetUserUsecaseOutput] is returned from [getUser] method
  @override
  Future<GetUserUsecaseOutput> getUser(GetUserUsecaseInput input) async {
    return _authLocalDataSource.getUser(input);
  }

  /// [SetUserUsecaseInput] is received to [setUser] method as parameter
  /// [SetUserUsecaseOutput] is returned from [setUser] method
  @override
  Future<SetUserUsecaseOutput> setUser(SetUserUsecaseInput input) async {
    return _authLocalDataSource.setUser(input);
  }

  /// [UpdateUserUsecaseInput] is received to [updateUser] method as parameter
  /// [UpdateUserUsecaseOutput] is returned from [updateUser] method
  @override
  Future<UpdateUserUsecaseOutput> updateUser(
      UpdateUserUsecaseInput input) async {
    return _authRemoteDataSource.updateUser(input);
  }

  /// [RemoveUserUsecaseInput] is received to [removeUser] method as parameter
  /// [RemoveUserUsecaseOutput] is returned from [removeUser] method
  @override
  Future<RemoveUserUsecaseOutput> removeUser(
      RemoveUserUsecaseInput input) async {
    return _authLocalDataSource.removeUser(input);
  }
}
