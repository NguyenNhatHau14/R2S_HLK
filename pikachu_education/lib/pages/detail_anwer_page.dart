import 'package:flutter/material.dart';
import 'package:pikachu_education/components/dialog_custom.dart';
import 'package:pikachu_education/data/data_user.dart';
import 'package:pikachu_education/routes/page_name.dart';

import '../data/data_image.dart';

class DetailAnswerPage extends StatefulWidget {
  const DetailAnswerPage({super.key});

  @override
  State<DetailAnswerPage> createState() => _DetailAnswerPageState();
}

class _DetailAnswerPageState extends State<DetailAnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 55,
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
                onTap: () {},

                child: Column(
                  children: [
                    Image.asset('assets/image/bottom_bar_home.png'),
                    const Text ('Home')
                  ],
                )
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Image.asset('assets/image/bottom_bar_home.png'),
                  const Text('My Post')
                ],
              ),
            ),
            InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Image.asset('assets/image/bottom_bar_me.png'),
                    const Text('Me')
                  ],
                )
            ),
          ]),
        ),
      ),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
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
            padding: const EdgeInsets.only(),
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0x33000000),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
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
                        padding: EdgeInsets.all(8.0),
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
                                Text(' Pikachu 1'),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFAC9),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(pikachu2.answeTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(pikachu2.answerContent),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.favorite_border),
                            Text('${pikachu2.numberOfLike}'),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.comment_sharp),
                            Text('${pikachu2.numberOfComment} comment'),
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
                                    pikachu2.avatar,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Text(pikachu2.name),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),


        ]),
      ),
    );
  }
}
