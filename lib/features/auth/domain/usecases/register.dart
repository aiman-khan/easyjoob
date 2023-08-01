import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../models/user/user.dart';
import '../repository/auth_repository.dart';

class RegisterUsecaseInput extends Input {
  final String name;
  final String phoneNumber;
  final String type;
  final String? company;

  RegisterUsecaseInput({
    required this.name,
    required this.phoneNumber,
    required this.type,
    this.company,
  });
}

class RegisterUsecaseOutput extends Output {
  final User user;

  RegisterUsecaseOutput({required this.user});
}

@lazySingleton
class RegisterUsecase
    extends Usecase<RegisterUsecaseInput, RegisterUsecaseOutput> {
  final AuthRepository _signUpRepository;

  RegisterUsecase({required AuthRepository signUpRepository})
      : _signUpRepository = signUpRepository;

  @override
  Future<RegisterUsecaseOutput> call(RegisterUsecaseInput input) async {
    return await _signUpRepository.register(input);
  }
}
