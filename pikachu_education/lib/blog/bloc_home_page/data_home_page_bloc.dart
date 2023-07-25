import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_education/service/data_service.dart';
import '../../data/data_questions_modal.dart';
part 'data_home_page_event.dart';
part 'data_home_page_state.dart';

class DataHomePageBloc extends Bloc<DataHomePageEvent, DataHomePageState> {
  DataHomePageBloc() : super(DataInitial(const <DataQuestionModal>[])) {
    on<GetDataHomePage>(_onGetDataHomePage);
    on<FetchDataHomePage>(_onFetchDataHomePage);
    on<PostDataHomePage>(_onPostDataHomePage);
    on<DeleteDataHomePage>(_onDeleteDataHomePage);
    on<UpdateDataHomePage>(_onUpdateDataHomePage);
  }

  _onGetDataHomePage(GetDataHomePage event, Emitter<DataHomePageState> emit) async {
    emit(DataLoading(state.dataList));
    var dataFromServer = await DataSerVice.getDataFromServer();
    emit (DataChangedSuccess(dataFromServer));
    print('Check Bloc: GET data of home page SUCCESSFUL');
  }

  _onFetchDataHomePage(FetchDataHomePage event, Emitter<DataHomePageState> emit) async{
  var dataFromServer = await DataSerVice.getDataFromServer();
  emit (DataChangedSuccess(dataFromServer));
  print('Check Bloc: FETCH data of home page SUCCESSFUL');
}

  _onPostDataHomePage(PostDataHomePage event, Emitter<DataHomePageState> emit) async{
    await DataSerVice.postDataFromServer(event.dataToPost);
    var dataFromServer = await DataSerVice.getDataFromServer();
    emit (DataPostSuccess(dataFromServer));
    print('Check Bloc: POST data of home page SUCCESSFUL');
  }

  _onDeleteDataHomePage(DeleteDataHomePage event, Emitter<DataHomePageState> emit) async{
    await DataSerVice.DeleteDataFromServer(event.idToDelete);
    var dataFromServer = await DataSerVice.getDataFromServer();
    emit (DataPostSuccess(dataFromServer));
    print('Check Bloc: DELETE data of home page SUCCESSFUL');
  }

  _onUpdateDataHomePage(UpdateDataHomePage event, Emitter<DataHomePageState> emit) async{
    await DataSerVice.updateDataFromServer(event.dataToUpdate);
    var dataFromServer = await DataSerVice.getDataFromServer();
    emit (DataPostSuccess(dataFromServer));
    print('Check Bloc: UPDATE data of home page SUCCESSFUL');
  }
}
