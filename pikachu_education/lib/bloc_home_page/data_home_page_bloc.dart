import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pikachu_education/service/data_service.dart';

import '../data/data_questions_modal.dart';

part 'data_home_page_event.dart';
part 'data_home_page_state.dart';

class DataHomePageBloc extends Bloc<DataHomePageEvent, DataHomePageState> {
  DataHomePageBloc() : super(DataInitial(const <DataQuestion>[])) {
    on<GetDataHomePage>(_onGetDataHomePage);
    on<FetchDataHomePage>(_onFetchDataHomePage);
  }

  _onGetDataHomePage(GetDataHomePage event, Emitter<DataHomePageState> emit) async {
    emit(DataLoading(state.dataList));
    var dataFromServer = await DataSerVice.getDataFromServer();
    emit (DataChangedSuccess(dataFromServer));
  }

  _onFetchDataHomePage(FetchDataHomePage event, Emitter<DataHomePageState> emit) async{
  var dataFromServer = await DataSerVice.getDataFromServer();
  emit (DataChangedSuccess(dataFromServer));
}
}
