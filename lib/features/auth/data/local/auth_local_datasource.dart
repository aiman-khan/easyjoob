////********** AUTOGENERATED FILE: DO NOT REMOVE ANY COMMENT IN THIS STYLE **********////
////********** START IMPORTS **********////
import '../../../../infrastructure/datasource.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/usecases/set_user.dart';
import '../../domain/usecases/remove_user.dart';
////********** END IMPORTS **********////

abstract class AuthLocalDataSource extends DataSource {
  ////********** START METHODS **********////
  /// [GetUserUsecaseInput] is received to [getUser] method as parameter
  /// [GetUserUsecaseOutput] is returned from [getUser] method
  Future<GetUserUsecaseOutput> getUser(GetUserUsecaseInput input);

  /// [SetUserUsecaseInput] is received to [setUser] method as parameter
  /// [SetUserUsecaseOutput] is returned from [setUser] method
  Future<SetUserUsecaseOutput> setUser(SetUserUsecaseInput input);

  /// [RemoveUserUsecaseInput] is received to [removeUser] method as parameter
  /// [RemoveUserUsecaseOutput] is returned from [removeUser] method
  Future<RemoveUserUsecaseOutput> removeUser(RemoveUserUsecaseInput input);

////********** END METHODS **********////
}