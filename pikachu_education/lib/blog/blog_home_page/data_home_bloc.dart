import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'data_home_event.dart';

part 'data_home_state.dart';

class DataHomeBloc extends Bloc<DataHomeEvent, DataHomeState> {
  DataHomeBloc() : super(DataHomeInitial()) {
    on<DataHomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchDataQuestionEvent>(_onFetchDataHomePageEvent);
    on<PostDataQuestionEvent>(_onPostDataQuestionEvent);
  }
}

_onFetchDataHomePageEvent(
    FetchDataQuestionEvent event, Emitter<DataHomeState> emit) async {
  emit(FetchDataQuestionLoadingState());
//todo
  emit(FetchDataQuestionSuccessState());
}

_onPostDataQuestionEvent(
    PostDataQuestionEvent event, Emitter<DataHomeState> emit) async {
  emit(FetchDataQuestionLoadingState());
//todo
  emit(FetchDataQuestionSuccessState());
}
