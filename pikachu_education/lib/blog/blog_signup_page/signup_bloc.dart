import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../service/service_signup/firebase_create_account.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignupPress>((event, emit) async{
      await CreateAccount.signup(event.user, event.email, event.password);
      emit(SignupSuccess());
    });
  }
}
