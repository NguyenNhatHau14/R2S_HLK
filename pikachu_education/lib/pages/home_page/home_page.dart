import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import '../../bloc_home_page/data_home_page_bloc.dart';
import '../../data/data_image.dart';
import '../../models/content_add_model.dart';
import '../../routes/page_name.dart';
import '../../service/add_question_service.dart';
import 'create_question_dialog.dart';

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

  @override
  void initState() {
    _dataHomePageBloc.add(GetDataHomePage());
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
          },
          child: BlocBuilder<DataHomePageBloc, DataHomePageState>(
            builder: (context, state) {
              if (state is DataChangedSuccess) {
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
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 1, right: 8),
                                child: SpeedDial(
                                  icon: Icons.menu,
                                  iconTheme: const IconThemeData(size: 35),
                                  foregroundColor: Colors.black,
                                  activeIcon: Icons.close,
                                  backgroundColor: const Color(0xFFFDCA15),
                                  buttonSize: const Size(50, 48),
                                  direction: SpeedDialDirection.down,
                                  children: [
                                    SpeedDialChild(
                                      backgroundColor: Colors.red,
                                      child: const Icon(Icons.people),
                                      label: 'Profile',
                                      labelBackgroundColor: Colors.red,
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, PageName.profilePage);
                                      },
                                    ),
                                    SpeedDialChild(
                                      backgroundColor: Colors.grey,
                                      child: const Icon(Icons.settings),
                                      label: 'Settings',
                                      labelBackgroundColor: Colors.grey,
                                      onTap: () {
                                        // Handle Phone menu action
                                      },
                                    ),
                                    SpeedDialChild(
                                      child: const Icon(Icons.camera),
                                      label: 'Camera',
                                      onTap: () {
                                        // Handle Camera menu action
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFDCA15),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            createQuestionPage(context),
                                      );
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          size: 35,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          'Add Question',
                                          style: TextStyle(fontSize: 25),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: SizedBox(
                                  height: 50,
                                  child: AnimSearchBar(
                                    boxShadow: true,
                                    width: MediaQuery.of(context).size.width,
                                    helpText: 'Search Question',
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      size: 35,
                                    ),
                                    textController: searchController,
                                    onSuffixTap: () {
                                      setState(() {
                                        searchController.clear();
                                      });
                                    },
                                    textFieldColor: Color(0xFFFDFFAE),
                                    color: Color(0xFFFDCA15),
                                    onSubmitted: (p0) {},
                                    animationDurationInMilli: 2000,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       DataSerVice.getDataFromServer();
                        //     },
                        //     child: Text('Check Get Data')),
                        Expanded(
                          child: SmartRefresher(
                            controller: _refreshController,
                            onRefresh: () {
                              context
                                  .read<DataHomePageBloc>()
                                  .add(FetchDataHomePage());
                            },
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: dataQuestionFromServer.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: Colors.transparent,
                                thickness: 0,
                              ),
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, PageName.listAnswerPage);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Color(0xFFFDFFAE),
                                                  Color(0xFFFFFFFF)
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8, right: 8, left: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                      'assets/image/pikachu_itachi.png'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8, left: 8),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            dataQuestionFromServer[
                                                                        index]
                                                                    .userName ??
                                                                '',
                                                            style: TextStyle(
                                                                fontSize: 15)),
                                                        Text(
                                                            '${dataQuestionFromServer[index].timeAgo ?? 0} day ago',
                                                            style: const TextStyle(
                                                                fontSize: 10,
                                                                color: Color(
                                                                    0x4D000000))),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8, left: 8),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.tag),
                                                  Text(
                                                    dataQuestionFromServer[
                                                                index]
                                                            .tag ??
                                                        '',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8, right: 8, left: 8),
                                              child: Text(
                                                  dataQuestionFromServer[index]
                                                          .title ??
                                                      '',
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8, right: 8, left: 8),
                                              child: Text(
                                                  dataQuestionFromServer[index]
                                                          .content ??
                                                      '',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8, right: 8, left: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                        child: Row(
                                                      children: [
                                                        Text(
                                                            '${dataQuestionFromServer[index].numberAnswer}'),
                                                        Icon(Icons.message)
                                                      ],
                                                    )),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      dataQuestionFromServer[
                                                                  index]
                                                              .favorite =
                                                          !(dataQuestionFromServer[
                                                                      index]
                                                                  .favorite ??
                                                              false);

                                                      setState(() {});
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                          child: Row(
                                                        children: [
                                                          Text(
                                                              '${dataQuestionFromServer[index].numberLike}'),
                                                          Icon((dataQuestionFromServer[
                                                                          index]
                                                                      .favorite ??
                                                                  false)
                                                              ? Icons.favorite
                                                              : Icons
                                                                  .favorite_border)
                                                        ],
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            ),
                          ),
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
