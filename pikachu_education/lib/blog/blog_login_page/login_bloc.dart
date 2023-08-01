import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:pikachu_education/data/data_modal/data_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/service_local_storage/service_save_data_to_local_storage.dart';
import '../../service/service_login/firebase_login.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginPressEvent>((event, emit) async {
      var checkLogin = await LoginWithEmail.login(
          event.email, event.password, event.context);
      if (checkLogin == true) {
        var userId = await LoginWithEmail.getUserId();
        SaveDataToLocal.saveDataUserId(userId: userId);
        emit(LoginSuccessState(userId: userId));
      }
      if (checkLogin == false) {
        emit(LoginUnSuccessState());
      }
    });
  }
}
