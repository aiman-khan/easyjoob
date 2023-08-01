import '../../../../infrastructure/repository.dart';
import '../usecases/register.dart';

import '../usecases/login.dart';
import '../usecases/get_user.dart';
import '../usecases/set_user.dart';
import '../usecases/update_user.dart';
import '../usecases/remove_user.dart';

abstract class AuthRepository extends Repository {
  /// [RegisterUsecaseInput] is received to [register] method as parameter
  /// [RegisterUsecaseOutput] is returned from [register] method
  Future<RegisterUsecaseOutput> register(RegisterUsecaseInput input);

  /// [LoginUsecaseInput] is received to [login] method as parameter
  /// [LoginUsecaseOutput] is returned from [login] method
  Future<LoginUsecaseOutput> login(LoginUsecaseInput input);

  /// [GetUserUsecaseInput] is received to [getUser] method as parameter
  /// [GetUserUsecaseOutput] is returned from [getUser] method
  Future<GetUserUsecaseOutput> getUser(GetUserUsecaseInput input);

  /// [SetUserUsecaseInput] is received to [setUser] method as parameter
  /// [SetUserUsecaseOutput] is returned from [setUser] method
  Future<SetUserUsecaseOutput> setUser(SetUserUsecaseInput input);

  /// [UpdateUserUsecaseInput] is received to [updateUser] method as parameter
  /// [UpdateUserUsecaseOutput] is returned from [updateUser] method
  Future<UpdateUserUsecaseOutput> updateUser(UpdateUserUsecaseInput input);

  /// [RemoveUserUsecaseInput] is received to [removeUser] method as parameter
  /// [RemoveUserUsecaseOutput] is returned from [removeUser] method
  Future<RemoveUserUsecaseOutput> removeUser(RemoveUserUsecaseInput input);
}
