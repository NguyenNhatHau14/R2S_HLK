part of 'data_home_page_bloc.dart';

abstract class DataHomePageState {
  List<DataQuestionModal> dataList;

  DataHomePageState(this.dataList);
}

class DataInitial extends DataHomePageState {
  DataInitial(super.dataList);
}
class DataLoading extends DataHomePageState{
  DataLoading(super.dataList);
}
class DataChangedSuccess extends DataHomePageState{
  DataChangedSuccess(super.dataList);
}
class DataPostSuccess extends DataHomePageState{
  DataPostSuccess(super.dataList);
}