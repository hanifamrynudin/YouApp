import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../auth/presentation/auth_bloc/auth_bloc.dart';
import '../../data/repositories/signup_repositories_impl.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupRepositoriesImpl signupRepositoriesImpl;
  final AuthBloc authBloc;

  SignupBloc({
    required this.signupRepositoriesImpl,
    required this.authBloc,
  }) : super(SignupInitial()) {
    on<SignupInitialize>(_onSignupInitialize);
    on<SignupButtonPressed>(_onSignupButtonPressed);
  }

  void _onSignupInitialize(
      SignupInitialize event, Emitter<SignupState> emit) async {
    emit(SignupInitial());
  }

  void _onSignupButtonPressed(
      SignupButtonPressed event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    String? message = await signupRepositoriesImpl.signupUser(
      body: event.body,
      confirm: event.confirm,
    );

    if (message == "User has been created successfully") {
      print("sukses");
      emit(
        SignupSuccessful(
          message: signupRepositoriesImpl.errorMessage != null
              ? signupRepositoriesImpl.errorMessage!
              : 'Signup Success',
        ),
      );
    } else {
      print("err");
      emit(
        SignupFailure(
          message: signupRepositoriesImpl.errorMessage != null
              ? signupRepositoriesImpl.errorMessage!
              : 'Signup unsuccessful',
        ),
      );
    }
  }
}
