import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState()); //! loading state
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccessState()); //! success state
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorgState(error: e.code)); //! error state
    } catch (e) {
      emit(LoginErrorgState(error: e.toString())); //! error state
    }
  }
}
