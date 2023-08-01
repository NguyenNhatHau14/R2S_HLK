part of 'data_home_bloc.dart';

@immutable
abstract class DataHomeState {}

class DataHomeInitial extends DataHomeState {}
class FetchDataQuestionLoadingState extends DataHomeState{}
class FetchDataQuestionSuccessState extends DataHomeState{}
class PostDataQuestionSuccessState extends DataHomeState{}