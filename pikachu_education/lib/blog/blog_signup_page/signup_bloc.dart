import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../service/service_signup/firebase_signup.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignupPress>((event, emit) async {
      var checkSignupSuccess = await Signup.signup(
          event.name, event.email, event.password, event.context);
      if (checkSignupSuccess == true) {
        emit(SignupSuccess());
      }
      if (checkSignupSuccess == false) {
        emit(SignupUnSuccess());
      }
    });
  }
}
