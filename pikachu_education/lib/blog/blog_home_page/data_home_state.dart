part of 'data_home_bloc.dart';

@immutable
abstract class DataHomeState {
}

class DataHomeInitial extends DataHomeState {
  List<DataQuestionModal> listDataUserModal;
  DataHomeInitial (this.listDataUserModal);
}
class FetchDataQuestionLoadingState extends DataHomeState {
  List<DataQuestionModal> listDataUserModal;
  FetchDataQuestionLoadingState(this.listDataUserModal);
}
class FetchDataQuestionSuccessState extends DataHomeState {
  List<DataQuestionModal> listDataUserModal;
  FetchDataQuestionSuccessState(this.listDataUserModal);
}
class PostDataQuestionSuccessState extends DataHomeState {
}
class GetCurrentUserSuccessState extends DataHomeState{
  DataUserModal currentUserInfo;
  GetCurrentUserSuccessState({required this.currentUserInfo});
}