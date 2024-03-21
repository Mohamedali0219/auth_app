part of 'register_cubit.dart';

sealed class RegisterStates {}

final class RegisterInitialState extends RegisterStates {}

final class RegisterLoadingState extends RegisterStates {}

final class RegisterSuccessState extends RegisterStates {}

final class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState({required this.error});
}
