import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_education/blog/blog_home_page/data_home_bloc.dart';
import 'package:pikachu_education/data/data_modal/data_question_modal.dart';
import 'package:pikachu_education/data/data_modal/data_user_modal.dart';
import '../../../../../routes/page_name.dart';
import '../../../../../utils/management_image.dart';
import 'component/pop_up_menu_item/pop_up_menu_button.dart';

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
                        Image.asset(ManagementImage.defaultAvatar2),
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
                        PopUpMenuButtonHomePage(
                          editQuestionFormFieldKey:
                              widget.editQuestionFormFieldKey,
                          dataQuestionFromServer: widget.dataQuestionFromServer,
                          checkOwner: checkOwner,
                          dataHomePageBloc: widget.dataHomePageBloc,
                          index: widget.index,
                          contentController: widget.contentController,
                          subjectController: widget.subjectController,
                          titleController: widget.titleController,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Row(
                      children: [
                         Padding(
                           padding: const EdgeInsets.only(right: 5),
                           child: SizedBox(width: 15,height: 15,child: Image.asset(ManagementImage.iconTag,fit: BoxFit.fill,)),
                         ),
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
