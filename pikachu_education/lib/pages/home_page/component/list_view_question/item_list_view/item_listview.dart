import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_education/blog/blog_home_page/data_home_bloc.dart';
import 'package:pikachu_education/data/data_modal/data_question_modal.dart';
import 'package:pikachu_education/data/data_modal/data_user_modal.dart';
import '../../../../../routes/page_name.dart';
import '../../../../../utils/management_image.dart';
import 'component/pop_up_menu_item/component/decline_dialog.dart';
import 'component/pop_up_menu_item/component/delete_question/delete_question_dialog.dart';
import 'component/pop_up_menu_item/component/edit_questions/edit_question_dialog.dart';

class ItemListviewQuestion extends StatefulWidget {
  const ItemListviewQuestion(
      {super.key,
      required this.index,
      required this.dataQuestionFromServer,
      required this.currentUserInfo,
      required this.dataHomePageBloc,
      required this.subjectController,
      required this.contentController,
      required this.titleController,
      required this.editQuestionFormFieldKey});

  final GlobalKey<FormState> editQuestionFormFieldKey;
  final TextEditingController titleController;
  final TextEditingController subjectController;
  final TextEditingController contentController;
  final List<DataQuestionModal> dataQuestionFromServer;
  final DataUserModal currentUserInfo;
  final DataHomePageBloc dataHomePageBloc;
  final int index;

  @override
  State<ItemListviewQuestion> createState() => _ItemListviewQuestionState();
}

class _ItemListviewQuestionState extends State<ItemListviewQuestion> {
  @override
  Widget build(BuildContext context) {
    bool checkOwner = widget.dataQuestionFromServer[widget.index].userId ==
        widget.currentUserInfo.userId;
    return BlocProvider.value(
      value: widget.dataHomePageBloc,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, PageName.listAnswerPage, arguments: [
                widget.dataQuestionFromServer[widget.index],
                widget.currentUserInfo,
              ]);
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
                    padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(ImageManagement.defaultAvatar2),
                        Padding(
                          padding: const EdgeInsets.only(right: 8, left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  widget.dataQuestionFromServer[widget.index]
                                      .userName,
                                  style: const TextStyle(fontSize: 15)),
                              Text(
                                  widget.dataQuestionFromServer[widget.index]
                                      .timePost,
                                  style: const TextStyle(
                                      fontSize: 10, color: Color(0x4D000000))),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: PopupMenuButton(
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                itemBuilder: (context) => <PopupMenuEntry>[
                                      PopupMenuItem(
                                        child: InkWell(
                                          onTap: () async {
                                            if (checkOwner) {
                                             await showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      EditQuestionDialog(
                                                        questionInfo: widget
                                                                .dataQuestionFromServer[
                                                            widget.index],
                                                        dataHomePageBloc: widget
                                                            .dataHomePageBloc,
                                                        contentController: widget
                                                            .contentController,
                                                        editQuestionFormFieldKey:
                                                            widget
                                                                .editQuestionFormFieldKey,
                                                        subjectController: widget
                                                            .subjectController,
                                                        titleController: widget
                                                            .titleController,
                                                      ));
                                             Navigator.pop(context);
                                            } else  {
                                             await showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      const DeclineDialog());
                                             Navigator.pop(context);
                                            }
                                          },
                                          child: const Row(
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
                                        child: InkWell(
                                          onTap: () async {
                                            if (checkOwner) {
                                             await showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      DeleteQuestionDialog(
                                                        dataHomePageBloc: widget
                                                            .dataHomePageBloc,
                                                        questionInfo: widget
                                                                .dataQuestionFromServer[
                                                            widget.index],
                                                      ));
                                              Navigator.pop(context);
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      const DeclineDialog());
                                            }
                                          },
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.delete,
                                                  color: Colors.red),
                                              Text('Delete',
                                                  style: TextStyle(
                                                      color: Colors.red)),
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
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.tag),
                        Text(
                          widget.dataQuestionFromServer[widget.index]
                              .questionSubject,
                          //TODO
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                    child: Text(
                        widget
                            .dataQuestionFromServer[widget.index].questionTitle,
                        //TODO
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                    child: Text(
                        //ToDo
                        widget.dataQuestionFromServer[widget.index]
                            .questionContent,
                        style: const TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                  '${widget.dataQuestionFromServer[widget.index].numberAnswer} answer' //ToDo
                                  // '${widget.dataQuestionFromServer[index].numberAnswer}'
                                  ),
                              const Icon(Icons.message)
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                    '${widget.dataQuestionFromServer[widget.index].numberLike} Like'
                                    // '${widget.dataQuestionFromServer[index].numberLike}'
                                    ),
                                const Icon(Icons.favorite_border
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
          )),
    );
  }
}
