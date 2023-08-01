import 'package:flutter/material.dart';
import 'package:pikachu_education/components/dialog_custom.dart';
import 'package:pikachu_education/routes/page_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/demo_data/test_data_answer.dart';
import '../post_answer/create_answer_page.dart';
import 'list_view_answer_page/listview_answer_page.dart';

class ListAnswerPage extends StatefulWidget {
  const ListAnswerPage({super.key});

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

  @override
  void initState() {
    loadDataForAnswerListPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        showDialog(context: context, builder: (context) =>createAnswerPage(context) );
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
        ListViewAnswerPage(mockListAnswers: mockListAnswers)
        ]),
      ),
    );
  }


}
