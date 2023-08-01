import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/auth_repository.dart';

class RemoveUserUsecaseInput extends Input {
  RemoveUserUsecaseInput();
}

class RemoveUserUsecaseOutput extends Output {
  RemoveUserUsecaseOutput();
}

@lazySingleton
class RemoveUserUsecase extends Usecase<RemoveUserUsecaseInput, RemoveUserUsecaseOutput> {
  final AuthRepository _authRepository;

  RemoveUserUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<RemoveUserUsecaseOutput> call(
      RemoveUserUsecaseInput input) async {
        return await _authRepository.removeUser(input);
     }
}
