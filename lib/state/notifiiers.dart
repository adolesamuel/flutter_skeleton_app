import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/repository.dart';
import '../providers/providers.dart';
import 'states.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  final SingleRepository _singleRepository;

  AppStateNotifier(Ref ref)
      : _singleRepository = ref.read(singleRepositoryProvider),
        super(InitialAppState());

  Future<void> getAppState({required String requestparams}) async {
    state = AppLoadingState();

    final getAppStateOrError =
        await _singleRepository.getAppState(requestParams: requestparams);

    state = getAppStateOrError.fold(
      (l) => AppFailureState(l),
      (r) => AppSuccessState(r),
    );
  }
}
