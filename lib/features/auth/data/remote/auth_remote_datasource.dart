import '../../../../infrastructure/datasource.dart';
import '../../domain/usecases/register.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/update_user.dart';

abstract class AuthRemoteDataSource extends DataSource {
  /// [RegisterUsecaseInput] is received to [register] method as parameter
  /// [RegisterUsecaseOutput] is returned from [register] method
  Future<RegisterUsecaseOutput> register(RegisterUsecaseInput input);

  /// [LoginUsecaseInput] is received to [login] method as parameter
  /// [LoginUsecaseOutput] is returned from [login] method
  Future<LoginUsecaseOutput> login(LoginUsecaseInput input);

  /// [UpdateUserUsecaseInput] is received to [updateUser] method as parameter
  /// [UpdateUserUsecaseOutput] is returned from [updateUser] method
  Future<UpdateUserUsecaseOutput> updateUser(UpdateUserUsecaseInput input);
}
