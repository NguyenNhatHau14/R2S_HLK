part of 'data_home_bloc.dart';

@immutable
abstract class DataHomePageState {}

class DataHomePageInitial extends DataHomePageState {
  List<DataQuestionModal> listDataUserModal;

  DataHomePageInitial(this.listDataUserModal);
}

class FetchDataQuestionLoadingState extends DataHomePageState {
  List<DataQuestionModal> listDataUserModal;

  FetchDataQuestionLoadingState(this.listDataUserModal);
}

class FetchDataQuestionSuccessState extends DataHomePageState {
  List<DataQuestionModal> listDataUserModal;

  FetchDataQuestionSuccessState(this.listDataUserModal);
}

class PostDataQuestionSuccessState extends DataHomePageState {}

class GetCurrentUserSuccessState extends DataHomePageState {
  DataUserModal currentUserInfo;

  GetCurrentUserSuccessState({required this.currentUserInfo});
}

class EditQuestionSuccessState extends DataHomePageState {}
class DeleteQuestionSuccessState extends DataHomePageState {}
class LogoutSuccessState extends DataHomePageState{}
