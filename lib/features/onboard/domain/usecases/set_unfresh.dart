import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/onboard_repository.dart';

class SetUnfreshUsecaseInput extends Input {
  SetUnfreshUsecaseInput();
}

class SetUnfreshUsecaseOutput extends Output {
  SetUnfreshUsecaseOutput();
}

@lazySingleton
class SetUnfreshUsecase
    extends Usecase<SetUnfreshUsecaseInput, SetUnfreshUsecaseOutput> {
  final OnboardRepository _onboardRepository;

  SetUnfreshUsecase({required OnboardRepository onboardRepository})
      : _onboardRepository = onboardRepository;

  @override
  Future<SetUnfreshUsecaseOutput> call(SetUnfreshUsecaseInput input) async {
    return await _onboardRepository.setUnfresh(input);
  }
}
