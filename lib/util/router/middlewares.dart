import '../../features/onboard/domain/usecases/is_fresh.dart';
import 'paths.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RouteMiddleWares {
  final IsFreshUsecase isFreshInstallUsecase;
  RouteMiddleWares({
    required this.isFreshInstallUsecase,
  });

  Future<String> notFreshInstall({required String finalRoute}) async {
    final isFreshInstall = await isFreshInstallUsecase(IsFreshUsecaseInput());
    return isFreshInstall.isFreshInstall ? RoutePaths.onBoarding : finalRoute;
  }
}
