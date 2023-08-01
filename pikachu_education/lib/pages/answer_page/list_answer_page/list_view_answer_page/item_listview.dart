import 'package:flutter/material.dart';
import '../../../../data/demo_data/test_data_answer.dart';
import '../../../../routes/page_name.dart';
class ItemListView extends StatefulWidget {
  const ItemListView({super.key,required this.mockListAnswers,required this.index});

  final List<User> mockListAnswers;
  final int index;

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, PageName.detailAnswerPage);
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
                  child: Text(widget.mockListAnswers[widget.index].answerTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(mockListAnswers[widget.index].answerContent),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          mockListAnswers[widget.index].favorite =
                          !mockListAnswers[widget.index].favorite;
                          setState(() {

                          });
                        },
                        child: Row(
                          children: [
                            Icon(mockListAnswers[widget.index].favorite
                                ? Icons.favorite
                                : Icons.favorite_border),
                            Text('${mockListAnswers[widget.index].numberOfLike}'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.comment_sharp),
                          Text(
                              '${mockListAnswers[widget.index].numberOfComment} comment'),
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
                                  mockListAnswers[widget.index].avatar,
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Text(mockListAnswers[widget.index].name),
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
