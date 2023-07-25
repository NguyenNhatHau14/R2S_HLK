import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../service/service_login/firebase_login.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginPress>((event, emit) async {
      var checkLogin = await LoginWithEmail.login(
              event.email, event.password, event.context);
      if (checkLogin == true) {
        emit(LoginSuccess());
      }
      if (checkLogin == false) {
        emit(LoginUnSuccess());
      }
    });
  }
}
