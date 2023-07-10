import 'package:flutter/material.dart';
import 'package:pikachu_education/components/commnet_form.dart';
import 'package:pikachu_education/data/data_user.dart';
import 'package:pikachu_education/routes/page_name.dart';
import '../components/like_form.dart';

class draftPage extends StatefulWidget {
  const draftPage({super.key});

  @override
  State<draftPage> createState() => _draftPageState();
}

class _draftPageState extends State<draftPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(
        length: 2, vsync: this, animationDuration: const Duration(seconds: 1));
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
                          pikachu3.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${pikachu3.dayAgo} day ago',
                          style: const TextStyle(fontSize: 15),
                        )
                      ],
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(pikachu3.answerTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(pikachu3.answerContent),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.favorite_border),
                          Text('${pikachu3.numberOfLike}'),
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
                            child: SizedBox(
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
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CommentForm(
                              avatar: pikachu1.avatar,
                              name: pikachu1.name,
                              dayAgo: pikachu1.dayAgo,
                              commentContent: pikachu1.comment),
                          CommentForm(
                              avatar: pikachu2.avatar,
                              name: pikachu2.name,
                              dayAgo: pikachu2.dayAgo,
                              commentContent: pikachu2.comment),
                          CommentForm(
                              avatar: pikachu3.avatar,
                              name: pikachu3.name,
                              dayAgo: pikachu3.dayAgo,
                              commentContent: pikachu3.comment),
                          CommentForm(
                              avatar: pikachu4.avatar,
                              name: pikachu4.name,
                              dayAgo: pikachu4.dayAgo,
                              commentContent: pikachu4.comment),
                          CommentForm(
                              avatar: pikachu5.avatar,
                              name: pikachu5.name,
                              dayAgo: pikachu5.dayAgo,
                              commentContent: pikachu5.comment)
                        ],
                      ),
                    ),
                  ),
                ]),
                Column(children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: LikeForm(
                                avatar: pikachu1.avatar,
                                name: pikachu1.name,
                                dayAgo: pikachu1.dayAgo),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: LikeForm(
                                avatar: pikachu2.avatar,
                                name: pikachu2.name,
                                dayAgo: pikachu2.dayAgo),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: LikeForm(
                                avatar: pikachu3.avatar,
                                name: pikachu3.name,
                                dayAgo: pikachu3.dayAgo),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: LikeForm(
                                avatar: pikachu4.avatar,
                                name: pikachu4.name,
                                dayAgo: pikachu4.dayAgo),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: LikeForm(
                                avatar: pikachu5.avatar,
                                name: pikachu5.name,
                                dayAgo: pikachu5.dayAgo),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
