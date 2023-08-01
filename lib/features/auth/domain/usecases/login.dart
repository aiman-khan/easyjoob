import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../models/user/user.dart';
import '../repository/auth_repository.dart';

class LoginUsecaseInput extends Input {
  final String phoneNumber;

  LoginUsecaseInput({required this.phoneNumber});
}

class LoginUsecaseOutput extends Output {
  final User user;

  LoginUsecaseOutput({required this.user});
}

@lazySingleton
class LoginUsecase extends Usecase<LoginUsecaseInput, LoginUsecaseOutput> {
  final AuthRepository _authRepository;

  LoginUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<LoginUsecaseOutput> call(LoginUsecaseInput input) async {
    return await _authRepository.login(input);
  }
}
