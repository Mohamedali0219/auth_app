import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState()); //! loading state

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccessState()); //! success state
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorState(error: 'weak password')); //! error state
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState(error: 'email already in use')); //! error state
      }
    } catch (e) {
      emit(RegisterErrorState(error: e.toString())); //! error state
    }
  }
}
