import 'package:injectable/injectable.dart';
import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../models/user/user.dart';
import '../repository/auth_repository.dart';

class SetUserUsecaseInput extends Input {
  SetUserUsecaseInput({required this.user});

  final User user;
}

class SetUserUsecaseOutput extends Output {
  SetUserUsecaseOutput();
}

@lazySingleton
class SetUserUsecase
    extends Usecase<SetUserUsecaseInput, SetUserUsecaseOutput> {
  final AuthRepository _authRepository;

  SetUserUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<SetUserUsecaseOutput> call(SetUserUsecaseInput input) async {
    return await _authRepository.setUser(input);
  }
}
