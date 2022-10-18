import 'package:skels/core/failures/failure.dart';

class AppState {}

class InitialAppState extends AppState {}

//Loading
//Success
//Failure.

class AppLoadingState extends AppState {}

class AppFailureState extends AppState {
  final Failure failure;

  AppFailureState(this.failure);
}

class AppSuccessState extends AppState {
  final dynamic success;

  AppSuccessState(this.success);
}
