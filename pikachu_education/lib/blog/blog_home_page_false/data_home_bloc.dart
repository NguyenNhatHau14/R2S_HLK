// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// import '../../data/data_modal/data_user_modal.dart';
// import '../../service/database_service/database_service.dart';
//
// part 'data_home_event.dart';
//
// part 'data_home_state.dart';
//
// class DataHomeBloc extends Bloc<DataHomeEvent, DataHomeState> {
//   DataHomeBloc() : super(DataHomeInitial(const [])) {
//     on<FetchDataQuestionEvent>(_onFetchDataHomePageEvent);
//     on<PostDataQuestionEvent>(_onPostDataQuestionEvent);
//   }
// }
//
// _onFetchDataHomePageEvent(
//     FetchDataQuestionEvent event, Emitter<DataHomeState> emit) async {
//   emit(FetchDataQuestionLoadingState(const []));
//   var listDataUsers = await DatabaseService.fetchDataQuestionFromSever();
//   emit(FetchDataQuestionSuccessState(listDataUsers));
//   print('check in inside _onFetchDataHomePageEvent:');
// }
//
// _onPostDataQuestionEvent(
//     PostDataQuestionEvent event, Emitter<DataHomeState> emit) async {}
