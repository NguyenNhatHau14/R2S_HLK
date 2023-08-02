import 'package:flutter/material.dart';
import '../../../../blog/blog_home_page/data_home_bloc.dart';
import '../../../../data/data_modal/data_user_modal.dart';
import '../../../../routes/page_name.dart';
class ListViewQuestion extends StatefulWidget {
  const ListViewQuestion({super.key,required this.dataQuestionFromServer,required this.dataHomePageBloc});

  final List<DataUserModal> dataQuestionFromServer;
  final  DataHomeBloc dataHomePageBloc;

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
                                const Text(
                                  //TODO
                                    '3 day ago',
                                    style: TextStyle(
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
                                          // await showDialog(
                                          //     context: context,
                                          //     builder: (context) => editQuestion(context: context, itemHomePage:  widget.dataQuestionFromServer[index], dataHomePageBloc: widget.dataHomePageBloc));
                                          // Navigator.pop(
                                          //     context);
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
                                          // await showDialog(
                                          //     context: context,
                                          //     builder: (context) => deleteQuestion(context: context, itemHomePage:  widget.dataQuestionFromServer[index], dataHomePageBloc: widget.dataHomePageBloc));
                                          // Navigator.pop(
                                          //     context);
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
                    const Padding(
                      padding: EdgeInsets.only(
                          right: 8, left: 8),
                      child: Row(
                        children: [
                          Icon(Icons.tag),
                          Text(
                                'toan',
                            //TODO
                            style: TextStyle(
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 8, right: 8, left: 8),
                      child: Text(
                              'title',
                          //TODO
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight:
                              FontWeight.bold)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 8, right: 8, left: 8),
                      child: Text(
                          //ToDo
                              'content',
                          style: TextStyle(
                              fontSize: 12)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, right: 8, left: 8),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: [
                          const Padding(
                            padding:
                            EdgeInsets.all(
                                8.0),
                            child: Row(
                              children: [
                                Text( 'number Answer'//ToDo
                                    // '${widget.dataQuestionFromServer[index].numberAnswer}'
                                ),
                                Icon(
                                    Icons.message)
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // widget.dataQuestionFromServer[
                              // index]
                              //     .favorite =
                              // !(widget.dataQuestionFromServer[
                              // index]
                              //     .favorite ??
                              //     false);
                              // DatabaseReference ref = FirebaseDatabase.instance.ref();
                              // print(ref);

                              setState(() {});
                            },
                            child: const Padding(
                              padding:
                              EdgeInsets.all(
                                  8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'numberLike'//ToDo
                                      // '${widget.dataQuestionFromServer[index].numberLike}'
                                  ),
                                  Icon(Icons.favorite_border
                                  //     (widget.dataQuestionFromServer[
                                  // index]
                                  //     .favorite ??
                                  //     false)
                                  //     ? Icons.favorite
                                  //     : Icons
                                  //     .favorite_border
                                  )
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
