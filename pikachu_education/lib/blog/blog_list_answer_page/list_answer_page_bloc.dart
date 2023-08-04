import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/data_modal/data_answer_modal.dart';
import '../../service/database_service/database_service.dart';

part 'list_answer_page_event.dart';

part 'list_answer_page_state.dart';

class ListAnswerPageBloc
    extends Bloc<ListAnswerPageEvent, ListAnswerPageState> {
  ListAnswerPageBloc() : super(ListAnswerPageInitial()) {
    on<PostAnswerEvent>((event, emit) async {
     await DatabaseService.postDataAnswerToSever(
          itemToPost: event.itemToPost,
          userIdOfQuestion: event.userIdOfQuestion,
          questionId: event.questionId);
     emit (PostAnswerSuccessState());
    });

    on<FetchDataAnswerList>((event, emit) async {
     var listDataAnswer = await DatabaseService.fetchDataAnswerFromSever(event.userIdOfQuestion,event.questionId);
     emit (FetchListAnswerPageSuccessState(listAnswers: listDataAnswer));
    });
  }
}
