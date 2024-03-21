part of 'login_cubit.dart';

sealed class LoginStates {}

final class LoginInitialState extends LoginStates {}

final class LoginLoadingState extends LoginStates {}

final class LoginSuccessState extends LoginStates {}

final class LoginErrorgState extends LoginStates {
  final String error;
  LoginErrorgState({required this.error});
}
