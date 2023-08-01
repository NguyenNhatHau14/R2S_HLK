part of 'data_home_page_bloc.dart';

@immutable
abstract class DataHomePageEvent {}
class GetDataHomePage extends DataHomePageEvent{}
class FetchDataHomePage extends DataHomePageEvent{}
class PostDataHomePage extends DataHomePageEvent{
  final DataQuestionModalTest dataToPost;

  PostDataHomePage ( {required this.dataToPost});
}
class DeleteDataHomePage extends DataHomePageEvent{
  final DataQuestionModalTest idToDelete;

  DeleteDataHomePage ( {required this.idToDelete});
}

class UpdateDataHomePage extends DataHomePageEvent{
  final DataQuestionModalTest dataToUpdate;

  UpdateDataHomePage ( {required this.dataToUpdate});
}

