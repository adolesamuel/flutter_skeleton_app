import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/network_info/network_info.dart';
import '../data/repositories/repository.dart';
import '../data/sources/local_source.dart';
import '../data/sources/remote_source.dart';
import '../state/notifiiers.dart';
import '../state/states.dart';

final singleRepositoryProvider = Provider<SingleRepository>(
  (ref) => SingleRepositoryImpl(
    networkInfo: ref.read(networkInfoProvider),
    remoteSource: ref.read(remoteSourceProvider),
    localDataSource: ref.read(localSourceProvider),
  ),
);

final appStateNotifierProvider =
    StateNotifierProvider<AppStateNotifier, AppState>(
  (ref) => AppStateNotifier(ref),
);
