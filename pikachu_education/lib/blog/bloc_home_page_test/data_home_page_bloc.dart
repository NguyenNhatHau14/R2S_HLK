//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pikachu_education/service/service_home_page/service_data_question.dart';
//
// import '../../data/demo_data/test_data_questions_modal.dart';
// part 'data_home_page_event.dart';
// part 'data_home_page_state.dart';
//
// class DataHomePageBloc extends Bloc<DataHomePageEvent, DataHomePageState> {
//   DataHomePageBloc() : super(DataInitial(const <DataQuestionModalTest>[])) {
//     on<GetDataHomePage>(_onGetDataHomePage);
//     on<FetchDataHomePage>(_onFetchDataHomePage);
//     on<PostDataHomePage>(_onPostDataHomePage);
//     on<DeleteDataHomePage>(_onDeleteDataHomePage);
//     on<UpdateDataHomePage>(_onUpdateDataHomePage);
//   }
//
//   _onGetDataHomePage(GetDataHomePage event, Emitter<DataHomePageState> emit) async {
//     emit(DataLoading(state.dataList));
//     var dataFromServer = await ServiceDataQuestion.getDataFromServer();
//     emit (DataChangedSuccess(dataFromServer));
//     //print('Check Bloc: GET data of home page SUCCESSFUL');
//   }
//
//   _onFetchDataHomePage(FetchDataHomePage event, Emitter<DataHomePageState> emit) async{
//   var dataFromServer = await ServiceDataQuestion.getDataFromServer();
//   emit (DataChangedSuccess(dataFromServer));
//   //print('Check Bloc: FETCH data of home page SUCCESSFUL');
// }
//
//   _onPostDataHomePage(PostDataHomePage event, Emitter<DataHomePageState> emit) async{
//     await ServiceDataQuestion.postDataFromServer(event.dataToPost);
//     var dataFromServer = await ServiceDataQuestion.getDataFromServer();
//     emit (DataPostSuccess(dataFromServer));
//    // print('Check Bloc: POST data of home page SUCCESSFUL');
//   }
//
//   _onDeleteDataHomePage(DeleteDataHomePage event, Emitter<DataHomePageState> emit) async{
//     await ServiceDataQuestion.DeleteDataFromServer(event.idToDelete);
//     var dataFromServer = await ServiceDataQuestion.getDataFromServer();
//     emit (DataPostSuccess(dataFromServer));
//    // print('Check Bloc: DELETE data of home page SUCCESSFUL');
//   }
//
//   _onUpdateDataHomePage(UpdateDataHomePage event, Emitter<DataHomePageState> emit) async{
//     await ServiceDataQuestion.updateDataFromServer(event.dataToUpdate);
//     var dataFromServer = await ServiceDataQuestion.getDataFromServer();
//     emit (DataPostSuccess(dataFromServer));
//    // print('Check Bloc: UPDATE data of home page SUCCESSFUL');
//   }
// }
