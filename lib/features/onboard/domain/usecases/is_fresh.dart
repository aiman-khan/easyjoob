import 'package:injectable/injectable.dart';

import '../../../../infrastructure/usecase.dart';
import '../../../../infrastructure/usecase_input.dart';
import '../../../../infrastructure/usecase_output.dart';

import '../repository/onboard_repository.dart';

class IsFreshUsecaseInput extends Input {
  IsFreshUsecaseInput();
}

class IsFreshUsecaseOutput extends Output {
  final bool isFreshInstall;

  IsFreshUsecaseOutput({required this.isFreshInstall});
}

@lazySingleton
class IsFreshUsecase
    extends Usecase<IsFreshUsecaseInput, IsFreshUsecaseOutput> {
  final OnboardRepository _onboardRepository;

  IsFreshUsecase({required OnboardRepository onboardRepository})
      : _onboardRepository = onboardRepository;

  @override
  Future<IsFreshUsecaseOutput> call(IsFreshUsecaseInput input) async {
    return await _onboardRepository.isFresh(input);
  }
}
