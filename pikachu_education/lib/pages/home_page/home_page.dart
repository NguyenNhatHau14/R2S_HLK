import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../blog/bloc_home_page_test/data_home_page_bloc.dart';
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

  final DataHomePageBloc _dataHomePageBloc = DataHomePageBloc();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  String userId = '';

  Future<void> loadDataUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userIdFromLocal = prefs.getString('userId') ?? '';

    setState(() {
      userId = userIdFromLocal;
    });
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _dataHomePageBloc.add(GetDataHomePage());
    loadDataUserId();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _dataHomePageBloc,
      child: Scaffold(
        body: BlocListener<DataHomePageBloc, DataHomePageState>(
          listener: (context, state) {
            if (state is DataChangedSuccess) {
              print('check refreshController');
              _refreshController.refreshCompleted();
            }
            if (state is DataPostSuccess) {
              context.read<DataHomePageBloc>().add(FetchDataHomePage());
            }
          },
          child: BlocBuilder<DataHomePageBloc, DataHomePageState>(
            builder: (context, state) {
              if (state is DataChangedSuccess || state is DataPostSuccess) {
                var dataQuestionFromServer = state.dataList;
                return SafeArea(
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
                            AddQuestionButton(
                                userId: userId,
                                dataHomePageBloc: _dataHomePageBloc),
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
                                    .read<DataHomePageBloc>()
                                    .add(FetchDataHomePage());
                              },
                              child: ListViewQuestion(
                                dataHomePageBloc: _dataHomePageBloc,
                                dataQuestionFromServer: dataQuestionFromServer,
                              )),
                        )
                      ]),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
