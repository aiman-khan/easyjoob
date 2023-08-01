import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../../../util/helpers/network_call_helper/network_call_helper.dart';
import 'home_remote_datasource.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  final Logger _logger;
  final NetworkCallHelper _networkCallHelper;
  final firestore = FirebaseFirestore.instance;

  HomeRemoteDataSourceImp({
    required Logger logger,
    required NetworkCallHelper networkCallHelper,
  })  : _logger = logger,
        _networkCallHelper = networkCallHelper;
}
