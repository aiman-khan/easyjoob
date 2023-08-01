import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../../../util/helpers/persistance/persistance_helper.dart';
import '../../domain/models/user/user.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/usecases/set_user.dart';
import '../entities/user/user.dart';
import 'auth_local_datasource.dart';
import '../../domain/usecases/remove_user.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImp implements AuthLocalDataSource {
  final Logger _logger;
  final PersistanceHelper _persistanceHelper;

  AuthLocalDataSourceImp({
    required Logger logger,
    required PersistanceHelper persistanceHelper,
  })  : _logger = logger,
        _persistanceHelper = persistanceHelper;

  @override
  Future<GetUserUsecaseOutput> getUser(GetUserUsecaseInput input) async {
    final stringUser = await _persistanceHelper.getString('user');

    if (stringUser == null) {
      throw NotLoginException();
    }

    final userEntity = UserEntity.fromJson(jsonDecode(stringUser));

    return GetUserUsecaseOutput(user: User.fromEntity(userEntity));
  }

  @override
  Future<SetUserUsecaseOutput> setUser(SetUserUsecaseInput input) async {
    // final stringUser = jsonEncode(input.user.toJson());

    await _persistanceHelper.saveString('user', "stringUser");
    return SetUserUsecaseOutput();
  }

  /// [RemoveUserUsecaseInput] is received to [removeUser] method as parameter
  /// [RemoveUserUsecaseOutput] is returned from [removeUser] method
  @override
  Future<RemoveUserUsecaseOutput> removeUser(
      RemoveUserUsecaseInput input) async {
    await _persistanceHelper.delete('user');
    return RemoveUserUsecaseOutput();
  }
}

class NotLoginException implements Exception {}
