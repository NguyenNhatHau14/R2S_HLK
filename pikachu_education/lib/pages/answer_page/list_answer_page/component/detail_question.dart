import 'package:flutter/material.dart';
import 'package:pikachu_education/data/data_modal/data_question_modal.dart';

class DetailQuestion extends StatefulWidget {
  const DetailQuestion({super.key,required this.dataQuestionModal});

  final DataQuestionModal dataQuestionModal;
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
                  child: Text(widget.dataQuestionModal.questionTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.dataQuestionModal.questionContent),
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
                       Row(
                        children: [
                          const Icon(Icons.comment_sharp),
                          Text('${widget.dataQuestionModal.numberAnswer} Answers'),
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
                           Text(widget.dataQuestionModal.userName),
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
