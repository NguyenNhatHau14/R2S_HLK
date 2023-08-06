import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_education/blog/blog_home_page/data_home_bloc.dart';
import 'package:pikachu_education/data/data_modal/data_user_modal.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../service/database_service/database_service.dart';
import '../../utils/management_image.dart';
import 'component/add_question/add_question_button.dart';
import 'component/draw_page.dart';
import 'component/list_view_question/list_view_question.dart';
import 'component/search_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.userId});

  final String userId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  bool showAddQuestionButton = true;

  final DataHomeBloc _dataHomeBloc = DataHomeBloc();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  DataUserModal currentUserInfo =
      DataUserModal(userId: 'userId', userName: 'userName', email: 'email');

  getCurrentUserInfo(String userID) async {
    var currentUserFromDataBase =
        await DatabaseService.getCurrentUserInfo(userID: userID);
    setState(() {
      currentUserInfo = currentUserFromDataBase;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _dataHomeBloc.add(FetchDataQuestionEvent());
    getCurrentUserInfo(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _dataHomeBloc,
      child:
          BlocListener<DataHomeBloc, DataHomeState>(listener: (context, state) {
        if (state is FetchDataQuestionSuccessState) {
          _refreshController.refreshCompleted();
        }
        if (state is PostDataQuestionSuccessState) {
          context.read<DataHomeBloc>().add(RefreshDataQuestion());
        }
      }, child: BlocBuilder<DataHomeBloc, DataHomeState>(
        builder: (context, state) {
          if (state is FetchDataQuestionSuccessState) {
            var dataQuestionFromServer = state.listDataUserModal;
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ImageManagement.logo),
                        ],
                      ),
                      Stack(
                        children: [
                          const DrawPageForHomePage(),
                          AddQuestionButton(
                              dataHomeBloc: _dataHomeBloc,
                              userId: currentUserInfo.userId),
                          SearchButton(
                            searchController: searchController,
                          )
                        ],
                      ),
                      Expanded(
                        child: SmartRefresher(
                            controller: _refreshController,
                            onRefresh: () {
                              context
                                  .read<DataHomeBloc>()
                                  .add(RefreshDataQuestion());
                            },
                            child: ListViewQuestion(
                              dataHomePageBloc: _dataHomeBloc,
                              dataQuestionFromServer: dataQuestionFromServer,
                              currentUserInfo: currentUserInfo,
                            )),
                      )
                    ]),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}
