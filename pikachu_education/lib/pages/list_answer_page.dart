import 'package:flutter/material.dart';
import 'package:pikachu_education/components/dialog_custom.dart';
import 'package:pikachu_education/data/data_user.dart';
import 'package:pikachu_education/routes/page_name.dart';

import '../data/data_image.dart';

class ListAnswerPage extends StatefulWidget {
  const ListAnswerPage({super.key});

  @override
  State<ListAnswerPage> createState() => _ListAnswerPageState();
}

class _ListAnswerPageState extends State<ListAnswerPage> {
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back, size: 25),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
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
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DialogCustom.dialogOfPostAnswer(context);
                        },
                      );
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
              child: ListView.builder(
                itemBuilder: (context, index) => item(lists[index]),
                itemCount: lists.length,
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget item(User user) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, PageName.detailAnswerWithLikePage);
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xFFFDFFAE), Color(0xFFFFFFFF)]),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(user.answerTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(user.answerContent),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.favorite_border),
                          Text('${user.numberOfLike}'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.comment_sharp),
                          Text('${user.numberOfComment} comment'),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                                width: 23,
                                height: 23,
                                child: Image.asset(
                                  user.avatar,
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Text(user.name),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
