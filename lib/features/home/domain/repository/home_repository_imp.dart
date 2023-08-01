import 'home_repository.dart';
import 'package:injectable/injectable.dart';
import '../../data/local/home_local_datasource.dart';
import '../../data/remote/home_remote_datasource.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
  final HomeLocalDataSource _homeLocalDataSource;
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImp({
    required HomeLocalDataSource homeLocalDataSource,
    required HomeRemoteDataSource homeRemoteDataSource,
  })  : _homeLocalDataSource = homeLocalDataSource,
        _homeRemoteDataSource = homeRemoteDataSource;
}
