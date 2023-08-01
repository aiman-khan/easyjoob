import '../../../../infrastructure/datasource.dart';
import '../../domain/usecases/is_fresh.dart';
import '../../domain/usecases/set_unfresh.dart';

abstract class OnboardLocalDataSource extends DataSource {
  /// [IsFreshUsecaseInput] is received to [isFresh] method as parameter
  /// [IsFreshUsecaseOutput] is returned from [isFresh] method
  Future<IsFreshUsecaseOutput> isFresh(IsFreshUsecaseInput input);

  /// [SetUnfreshUsecaseInput] is received to [setUnfresh] method as parameter
  /// [SetUnfreshUsecaseOutput] is returned from [setUnfresh] method
  Future<SetUnfreshUsecaseOutput> setUnfresh(SetUnfreshUsecaseInput input);
}
