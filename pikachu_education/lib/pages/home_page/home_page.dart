import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_education/blog/blog_home_page/data_home_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/data_image.dart';
import 'component/home_page/add_question/add_question_button.dart';
import 'component/home_page/draw_page.dart';
import 'component/home_page/list_view_question.dart';
import 'component/home_page/search_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  bool showAddQuestionButton = true;

  final DataHomeBloc _dataHomeBloc = DataHomeBloc();

  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  String userId = '';

  Future<void> loadDataUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userIdFromLocal = prefs.getString('userId') ?? '';

    // setState(() {
    //   userId = userIdFromLocal;
    // });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _dataHomeBloc.add(FetchDataQuestionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _dataHomeBloc,
      child: BlocListener<DataHomeBloc, DataHomeState>(
        listener: (context, state) {
          if(state is FetchDataQuestionSuccessState){
            _refreshController.refreshCompleted();
          }
        },
        child: BlocBuilder<DataHomeBloc, DataHomeState>(
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
                            Image.asset(logoImage.image),
                          ],
                        ),
                        Stack(
                          children: [
                            const DrawPageForHomePage(),
                            const AddQuestionButton(),
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
                              )),
                        )
                      ]),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
