import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../models/user/user.dart';
import '../repository/auth_repository.dart';

class UpdateUserUsecaseInput extends Input {
  UpdateUserUsecaseInput({
    required this.userId,
    this.image,
    this.name,
  });

  final int userId;
  final String? image;
  final String? name;
}

class UpdateUserUsecaseOutput extends Output {
  UpdateUserUsecaseOutput({required this.user});

  final User user;
}

@lazySingleton
class UpdateUserUsecase
    extends Usecase<UpdateUserUsecaseInput, UpdateUserUsecaseOutput> {
  final AuthRepository _authRepository;

  UpdateUserUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<UpdateUserUsecaseOutput> call(UpdateUserUsecaseInput input) async {
    return await _authRepository.updateUser(input);
  }
}
