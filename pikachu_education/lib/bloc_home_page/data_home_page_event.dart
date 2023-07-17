part of 'data_home_page_bloc.dart';

@immutable
abstract class DataHomePageEvent {}
class GetDataHomePage extends DataHomePageEvent{}
class FetchDataHomePage extends DataHomePageEvent{}
class PostDataHomePage extends DataHomePageEvent{
  final DataQuestionModal dataToPost;

  PostDataHomePage ( {required this.dataToPost});
}
class DeleteDataHomePage extends DataHomePageEvent{
  final DataQuestionModal idToDelete;

  DeleteDataHomePage ( {required this.idToDelete});
}

