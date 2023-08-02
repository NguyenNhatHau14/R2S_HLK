part of 'data_home_bloc.dart';

@immutable
abstract class DataHomeEvent {}
class FetchDataQuestionEvent extends DataHomeEvent{}
class RefreshDataQuestion extends DataHomeEvent{}

