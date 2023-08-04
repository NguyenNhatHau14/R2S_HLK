import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_education/components/dialog_custom.dart';
import 'package:pikachu_education/routes/page_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../blog/blog_list_answer_page/list_answer_page_bloc.dart';
import '../post_answer/create_answer_page.dart';
import 'list_view_answer_page/listview_answer_page.dart';

class ListAnswerPage extends StatefulWidget {
  const ListAnswerPage(
      {super.key, required this.questionId, required this.userIdOfQuestion,required this.currentUserId, required this.currentUserName});

  final String questionId;
  final String userIdOfQuestion;
  final String currentUserName;
  final String currentUserId;

  @override
  State<ListAnswerPage> createState() => _ListAnswerPageState();
}

class _ListAnswerPageState extends State<ListAnswerPage> {
  String? userForPage;

  Future<void> loadDataForAnswerListPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('user') ?? '';
    setState(() {
      userForPage = user;
    });
  }

  String userId = '';

  Future<void> loadDataUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userIdFromLocal = prefs.getString('userId') ?? '';

    setState(() {
      userId = userIdFromLocal;
    });
  }

  final ListAnswerPageBloc _listAnswerPageBloc = ListAnswerPageBloc();

  @override
  void initState() {
    loadDataForAnswerListPage();
    loadDataUserId();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _listAnswerPageBloc,
      child: Scaffold(
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back, size: 25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, PageName.loginPage);
                        },
                        child: Text(
                            (userForPage?.length ?? 0) == 0
                                ? 'Login'
                                : '${userForPage ?? ''}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal)),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
              child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xFFFDFFAE), Color(0xFFFFFFFF)]),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('How to calculate',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('1+1=?'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.favorite_border),
                                  Text('123'),
                                ],
                              ),
                              const Row(
                                children: [
                                  Icon(Icons.comment_sharp),
                                  Text('3 Answers'),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: 23,
                                      height: 23,
                                      child: Image.asset(
                                        'assets/image/pikachu.png',
                                        fit: BoxFit.fill,
                                      )),
                                  const Text(' Pikachu 1'),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.transparent,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFFDCA15)),
                      ),
                      onPressed: () {
                        if ((userForPage?.length ?? 0) == 0) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return DialogCustom.dialogOfPostAnswer(context);
                            },
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => createAnswerPage(
                                    listAnswerPageBloc: _listAnswerPageBloc,
                                    userIdOfQuestion: widget.userIdOfQuestion,
                                    questionId: widget.questionId, currentUserId: widget.currentUserId, currentUserName: widget.currentUserName,
                                  ));
                          // showModalBottomSheet(
                          //     backgroundColor: const Color(0xFFFDFFAE),
                          //     shape: const RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.vertical(
                          //             top: Radius.circular(20))),
                          //     context: context,
                          //     builder: (context) {

                          // });
                        }
                      },
                      child: const Text(
                        'Post Answer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25),
                      )),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25, left: 10, right: 10),
              child: Text('3 Answers',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            ListViewAnswerPage(
              listAnswerPageBloc: _listAnswerPageBloc,
              questionId: widget.questionId,
              useIdOfQuestion: widget.userIdOfQuestion,
            )
          ]),
        ),
      ),
    );
  }
}
