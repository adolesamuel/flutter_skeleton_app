import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../failures/failure.dart';
import '../network_info/network_info.dart';

///this service runner is used to shorten the repository code.
///It returns either a Failure or type [T].
///example of usage:
///``` ServiceRunner<Failure, bool> sR = ServiceRunner(networkInfo);
///
///``` return  sR.tryRemoteandCatch(
/// call: remoteDataSource.logout(user: user),
/// errorTitle: ErrorStrings.LOG_OUT_ERROR);
class ServiceRunner<Failure, T> {
  NetworkInfo networkInfo;

  ServiceRunner(this.networkInfo);

  ///Just a DRY Don't Repeat Yourself class
  ///This is used for catching errors from local data source.
  /// [call] runs a function that returns the required [Future] type.
  /// [errorTitle] string is used as the error title for all exceptions
  Future<Either<Failure, T>> tryLocalandCatch({
    required Future<T> call,
    required String errorTitle,
  }) async {
    try {
      return Right(
          await call.timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException('Time Out Exception');
      }));
    } on Exception catch (e) {
      return Left(
          CacheFailure(title: errorTitle, message: e.toString()) as Failure);
    }
  }

  ///A don't repeat yourself class,
  /// this is used for catching errors from remote data source.
  /// [call] runs a function that returns the required [Future] type.
  /// [errorTitle] string is used as the error title for all exceptions
  Future<Either<Failure, T>> tryRemoteandCatch({
    required Future<T> call,
    required String errorTitle,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(
            await call.timeout(const Duration(seconds: 30), onTimeout: () {
          throw TimeoutException('Time out exception.');
        }));
      } on HandshakeException catch (e) {
        return Left(
            InternetFailure('$errorTitle : No Internet access', e.message)
                as Failure);
      } on SocketException catch (e) {
        return Left(
            InternetFailure('$errorTitle : No Internet access', e.message)
                as Failure);
      } on FormatException catch (e) {
        return Left(InternetFailure(errorTitle, e.message) as Failure);
      } on Exception catch (e) {
        return Left(
            CommonFailure(errorTitle, e.toString().replaceAll('Exception:', ''))
                as Failure);
      }
    } else {
      //no network Connection
      return Left(InternetFailure(errorTitle, 'No Internet access') as Failure);
    }
  }
}
