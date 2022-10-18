import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../models/authentication/authenticated_user.dart';

final authLocalSourceProvider =
    Provider<AuthLocalDataSource>((ref) => AuthLocalDataSourceImpl());

abstract class AuthLocalDataSource {
  Future<AuthenticatedUser> saveAuthenticatedUser(AuthenticatedUser authUser);
  Future<bool> clearAuthenticatedUser();
  Future<AuthenticatedUser?> getAuthenticatedUser();
  Stream<AuthenticatedUser?> streamUserStatus();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _userKey = 'auth_user';

  @override
  Future<bool> clearAuthenticatedUser() async {
    final box = await Hive.openBox(_userKey);

    try {
      box.clear();
      return true;
    } on Exception catch (e) {
      throw Exception(e);
    } finally {}
  }

  @override
  Future<AuthenticatedUser> saveAuthenticatedUser(
      AuthenticatedUser authUser) async {
    final box = await Hive.openBox(_userKey);

    try {
      await box.put(_userKey, authUser.toJson());
      return authUser;
    } on Exception catch (e) {
      throw Exception(e);
    } finally {}
  }

  @override
  Future<AuthenticatedUser?> getAuthenticatedUser() async {
    final box = await Hive.openBox(_userKey);

    try {
      final String? userString = await box.get(_userKey);

      if (userString != null) {
        return AuthenticatedUser.fromJson(userString);
      } else {
        return null;
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<AuthenticatedUser?> streamUserStatus() async* {
    final box = await Hive.openBox(_userKey);

    yield* box.watch(key: _userKey).map((event) {
      return AuthenticatedUser.fromJson(event.value);
    }).asBroadcastStream();
  }
}
