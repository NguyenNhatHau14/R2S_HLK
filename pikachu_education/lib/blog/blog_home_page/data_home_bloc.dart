import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/data_modal/data_user_modal.dart';
import '../../service/database_service/database_service.dart';

part 'data_home_event.dart';
part 'data_home_state.dart';

class DataHomeBloc extends Bloc<DataHomeEvent, DataHomeState> {
  DataHomeBloc() : super(DataHomeInitial(const <DataUserModal>[])) {


    on<FetchDataQuestionEvent>((event, emit) async {
      emit(FetchDataQuestionLoadingState(const []));
      var listDataUsers = await DatabaseService.fetchDataQuestionFromSever();
      emit(FetchDataQuestionSuccessState(listDataUsers));
    });

    on<RefreshDataQuestion>((event, emit) async {
      var listDataUsers = await DatabaseService.fetchDataQuestionFromSever();
      emit(FetchDataQuestionSuccessState(listDataUsers));
      print(listDataUsers[1].userId);
    });
  }
}
