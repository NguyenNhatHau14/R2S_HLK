import 'package:flutter/material.dart';
import 'package:pikachu_education/data/data_modal/data_answer_modal.dart';
import 'package:pikachu_education/pages/answer_page/detail_answer_page/tab_view.dart';
import 'package:pikachu_education/routes/page_name.dart';

import '../../../data/demo_data/test_data_answer.dart';

class DetailAnswerPage extends StatefulWidget {
  const DetailAnswerPage({super.key, required this.answerInfo});

  final DataAnswerModal answerInfo;

  @override
  State<DetailAnswerPage> createState() => _DetailAnswerPageState();
}

class _DetailAnswerPageState extends State<DetailAnswerPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(
        length: 2, vsync: this, animationDuration: const Duration(seconds: 1));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, PageName.loginPage);
                        },
                        child: const Text('Login',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal)),
                      ),
                    )
                  ]),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xFFFDFFAE), Color(0xFFFFFFFF)]),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 6,
                          child: Image.asset(pikachu3.avatar, fit: BoxFit.fill)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.answerInfo.userNamePost,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            '10 day ago',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.answerInfo.answerTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.answerInfo.answerContent),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.comment_sharp),
                            Text('${pikachu2.numberOfComment} comment'),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.favorite_border),
                            Text('${pikachu3.numberOfLike}'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            TabBar(
                overlayColor: MaterialStateProperty.all(Colors.white),
                indicatorColor: Colors.yellowAccent,
                controller: tabController,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Comment',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('like',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ]),
            Container(height: 500,
              child: TabViewDetailAnswer(
                tabController: tabController,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
