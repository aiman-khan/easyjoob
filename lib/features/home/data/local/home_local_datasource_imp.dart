import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../../../util/helpers/persistance/persistance_helper.dart';
import 'home_local_datasource.dart';

@LazySingleton(as: HomeLocalDataSource)
class HomeLocalDataSourceImp implements HomeLocalDataSource {
  final Logger _logger;
  final PersistanceHelper _persistanceHelper;

  HomeLocalDataSourceImp({
    required Logger logger,
    required PersistanceHelper persistanceHelper,
  })  : _logger = logger,
        _persistanceHelper = persistanceHelper;
}
