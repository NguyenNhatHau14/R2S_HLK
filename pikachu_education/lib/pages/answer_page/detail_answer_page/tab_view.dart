import 'package:flutter/material.dart';

import '../../../components/commnet_form.dart';
import '../../../components/like_form.dart';
import '../../../data/demo_data/test_data_answer.dart';

class TabViewDetailAnswer extends StatefulWidget {
  const TabViewDetailAnswer({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<TabViewDetailAnswer> createState() => _TabViewDetailAnswerState();
}

class _TabViewDetailAnswerState extends State<TabViewDetailAnswer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: widget.tabController,
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
    );
  }
}
