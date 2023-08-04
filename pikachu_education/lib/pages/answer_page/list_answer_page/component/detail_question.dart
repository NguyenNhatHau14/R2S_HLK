import 'package:flutter/material.dart';
import 'package:pikachu_education/data/data_modal/data_question_modal.dart';

class DetailQuestion extends StatefulWidget {
  const DetailQuestion({super.key,required this.dataQuestionInfo});

  final DataQuestionModal dataQuestionInfo;
  @override
  State<DetailQuestion> createState() => _DetailQuestionState();
}

class _DetailQuestionState extends State<DetailQuestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.dataQuestionInfo.questionTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.dataQuestionInfo.questionContent),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Row(
                        children: [
                          const Icon(Icons.favorite_border),
                          Text('${widget.dataQuestionInfo.numberLike}'),
                        ],
                      ),
                       Row(
                        children: [
                          const Icon(Icons.comment_sharp),
                          Text('${widget.dataQuestionInfo.numberAnswer} Answers'),
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
                           Text(widget.dataQuestionInfo.userName),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
