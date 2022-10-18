import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api/api_endpoints.dart';
import '../../core/network_request/network_request.dart';
import '../../core/network_retry/network_retry.dart';
import '../../core/runner/response_processor.dart';

final remoteSourceProvider = Provider<RemoteSource>((ref) =>
    RemoteDataSourceImpl(
        networkRequest: ref.read(networkRequestProvider),
        networkRetry: ref.read(networkRetryProvider)));

abstract class RemoteSource {
  Future<dynamic> getAppRemote(String requestparams);
}

class RemoteDataSourceImpl implements RemoteSource {
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  RemoteDataSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<dynamic> getAppRemote(String params) async {
    final String url = '${Endpoint.loginEndpoint}$params/';

    final response = await networkRetry.networkRetry(() => networkRequest.post(
          url,
          body: json.encode({"params": params}),
          headers: {
            HttpHeaders.authorizationHeader:
                'getTokenFromAuthManagerOrEnviroment',
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Accept-Encoding': 'gzip, deflate, br',
          },
        ));

    return processResponse<bool>(
        response: response,
        successCode: 204,
        serializer: (data) {
          return true;
        });
  }
}
