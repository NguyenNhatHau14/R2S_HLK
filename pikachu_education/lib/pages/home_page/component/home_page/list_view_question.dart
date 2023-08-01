import 'package:flutter/material.dart';
import '../../../../blog/bloc_home_page_test/data_home_page_bloc.dart';
import '../../../../data/demo_data/test_data_questions_modal.dart';
import '../../../../routes/page_name.dart';
import '../list_view_questions/delete_question_dialog.dart';
import '../list_view_questions/edit_question_dialog.dart';
class ListViewQuestion extends StatefulWidget {
  const ListViewQuestion({super.key,required this.dataQuestionFromServer,required this.dataHomePageBloc});

  final List<DataQuestionModalTest> dataQuestionFromServer;
  final  DataHomePageBloc dataHomePageBloc;

  @override
  State<ListViewQuestion> createState() => _ListViewQuestionState();
}

class _ListViewQuestionState extends State<ListViewQuestion> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.dataQuestionFromServer.length,
      separatorBuilder: (context, index) =>
      const Divider(
        color: Colors.transparent,
        thickness: 0,
      ),
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, PageName.listAnswerPage);
              },
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xFFFDFFAE),
                          Color(0xFFFFFFFF)
                        ]),
                    borderRadius:
                    BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, right: 8, left: 8),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: [
                          Image.asset(
                              'assets/image/pikachu_itachi.png'),
                          Padding(
                            padding:
                            const EdgeInsets.only(
                                right: 8, left: 8),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [
                                Text(
                                    widget.dataQuestionFromServer[
                                    index]
                                        .userName ??
                                        '',
                                    style:
                                    const TextStyle(
                                        fontSize:
                                        15)),
                                Text(
                                    '${ widget.dataQuestionFromServer[index].timeAgo ?? 0} day ago',
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Color(
                                            0x4D000000))),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment:
                              AlignmentDirectional
                                  .centerEnd,
                              child: PopupMenuButton(
                                  shape: ContinuousRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          20)),
                                  itemBuilder:
                                      (context) =>
                                  <PopupMenuEntry>[
                                    PopupMenuItem(
                                      child:
                                      InkWell(
                                        onTap:
                                            () async {
                                          await showDialog(
                                              context: context,
                                              builder: (context) => editQuestion(context: context, itemHomePage:  widget.dataQuestionFromServer[index], dataHomePageBloc: widget.dataHomePageBloc));
                                          Navigator.pop(
                                              context);
                                        },
                                        child:
                                        const Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.edit),
                                            Text('Edit'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      child:
                                      InkWell(
                                        onTap:
                                            () async {
                                          await showDialog(
                                              context: context,
                                              builder: (context) => deleteQuestion(context: context, itemHomePage:  widget.dataQuestionFromServer[index], dataHomePageBloc: widget.dataHomePageBloc));
                                          Navigator.pop(
                                              context);
                                        },
                                        child:
                                        const Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.delete,
                                                color: Colors.red),
                                            Text('Delete',
                                                style: TextStyle(color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8, left: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.tag),
                          Text(
                            widget.dataQuestionFromServer[
                            index]
                                .tag ??
                                '',
                            style: const TextStyle(
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, right: 8, left: 8),
                      child: Text(
                          widget.dataQuestionFromServer[index]
                              .title ??
                              '',
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight:
                              FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, right: 8, left: 8),
                      child: Text(
                          widget.dataQuestionFromServer[index]
                              .content ??
                              '',
                          style: const TextStyle(
                              fontSize: 12)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, right: 8, left: 8),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.all(
                                8.0),
                            child: Row(
                              children: [
                                Text(
                                    '${widget.dataQuestionFromServer[index].numberAnswer}'),
                                const Icon(
                                    Icons.message)
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              widget.dataQuestionFromServer[
                              index]
                                  .favorite =
                              !(widget.dataQuestionFromServer[
                              index]
                                  .favorite ??
                                  false);
                              // DatabaseReference ref = FirebaseDatabase.instance.ref();
                              // print(ref);

                              setState(() {});
                            },
                            child: Padding(
                              padding:
                              const EdgeInsets.all(
                                  8.0),
                              child: Row(
                                children: [
                                  Text(
                                      '${widget.dataQuestionFromServer[index].numberLike}'),
                                  Icon((widget.dataQuestionFromServer[
                                  index]
                                      .favorite ??
                                      false)
                                      ? Icons.favorite
                                      : Icons
                                      .favorite_border)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
