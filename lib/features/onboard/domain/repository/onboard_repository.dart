////********** AUTOGENERATED FILE: DO NOT REMOVE ANY COMMENT IN THIS STYLE **********////
////********** START IMPORTS **********////
import '../../../../infrastructure/repository.dart';
import '../usecases/is_fresh.dart';
import '../usecases/set_unfresh.dart';
////********** END IMPORTS **********////

abstract class OnboardRepository extends Repository {
////********** START METHODS **********////
  /// [IsFreshUsecaseInput] is received to [isFresh] method as parameter
  /// [IsFreshUsecaseOutput] is returned from [isFresh] method
  Future<IsFreshUsecaseOutput> isFresh(IsFreshUsecaseInput input);

  /// [SetUnfreshUsecaseInput] is received to [setUnfresh] method as parameter
  /// [SetUnfreshUsecaseOutput] is returned from [setUnfresh] method
  Future<SetUnfreshUsecaseOutput> setUnfresh(SetUnfreshUsecaseInput input);

////********** END METHODS **********////
}