import 'package:flutter/material.dart';
import 'package:pikachu_education/data/data_user.dart';
import 'package:pikachu_education/routes/page_name.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({super.key});

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back, size: 25),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('3 Answers',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 13,
                color: Colors.transparent,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, PageName.loginPage);
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
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => item(lists[index]),
              itemCount: lists.length,
            ),
          )
        ]),
      ),
    );
  }

  var numberFavorite = 0;
  bool favoriteIcon = false;

  Widget item(User user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 7,
                      height: MediaQuery.of(context).size.height / 13,
                      child: Image.asset(user.avatar, fit: BoxFit.fill),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          user.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          '1 day ago',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(user.answerContent),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                if (numberFavorite == 0) {
                                  numberFavorite += 1;
                                }
                                if (numberFavorite == 1) {
                                  numberFavorite -= 1;
                                }
                                favoriteIcon = !favoriteIcon;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(favoriteIcon
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${user.numberOfLike}'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.comment),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${user.numberOfComment}'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
