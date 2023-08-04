import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_education/data/data_modal/data_answer_modal.dart';
import '../../../../../blog/blog_list_answer_page/list_answer_page_bloc.dart';
import '../../../../../routes/page_name.dart';

class ItemListView extends StatefulWidget {
  const ItemListView(
      {super.key,
      required this.index,
      required this.listAnswerPageBloc,
      required this.listDataAnswerFromSever});

  final ListAnswerPageBloc listAnswerPageBloc;
  final List<DataAnswerModal> listDataAnswerFromSever;

  final int index;

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: widget.listAnswerPageBloc,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, PageName.detailAnswerPage,arguments:widget.listDataAnswerFromSever[widget.index] );
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
                      child: Text(
                          widget.listDataAnswerFromSever[widget.index].answerTitle,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        widget.listDataAnswerFromSever[widget.index].answerContent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.favorite_border,
                                ),
                                Text('number like'),
                              ],
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.comment_sharp),
                              Text('number comment'),
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
                                      'assets/image/pikachu.png',
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Text(widget
                                  .listDataAnswerFromSever[widget.index].userNamePost),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
