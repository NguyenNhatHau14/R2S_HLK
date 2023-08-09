import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

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
      var checkLogin = await LoginService.login(
          event.email, event.password, event.context);
      if (checkLogin == true) {
        var userId = await LoginService.getUserId();
        await SaveDataToLocal.saveDataUserId(userId: userId);
        await SaveDataToLocal.saveDataUserName(userId: userId);
        emit(LoginSuccessState(userId: userId));

      }
      if (checkLogin == false) {
        emit(LoginUnSuccessState());
      }
    });
    on<AutoLogin>((event, emit) async {
      var checkLogin = await LoginService.checkAlreadyLogin();
      if( checkLogin){
        var userId = await LoginService.getUserId();
        await SaveDataToLocal.saveDataUserId(userId: userId);
        await SaveDataToLocal.saveDataUserName(userId: userId);
        emit(AutoLoginSuccessState(userId: userId));
      }
      else{
        emit(LoginUnSuccessState());
      }
    });


  }
}
