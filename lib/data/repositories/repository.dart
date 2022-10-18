import 'package:dartz/dartz.dart';
import 'package:skels/core/failures/failure.dart';

import '../../constants/strings.dart';
import '../../core/network_info/network_info.dart';
import '../../core/runner/service.dart';
import '../sources/local_source.dart';
import '../sources/remote_source.dart';

abstract class SingleRepository {
  Future<Either<Failure, dynamic>> getAppState({required String requestParams});
}

class SingleRepositoryImpl implements SingleRepository {
  final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;
  final RemoteSource remoteSource;

  SingleRepositoryImpl({
    required this.networkInfo,
    required this.remoteSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> getAppState(
      {required String requestParams}) {
    final ServiceRunner<Failure, dynamic> sR = ServiceRunner(networkInfo);

    return sR.tryRemoteandCatch(
        call: remoteSource.getAppRemote(requestParams),
        errorTitle: ErrorStrings.ERROR_MAKING_REQUESTS);
  }
}
