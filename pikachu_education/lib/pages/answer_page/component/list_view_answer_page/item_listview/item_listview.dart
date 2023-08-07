import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_education/data/data_modal/data_answer_modal.dart';
import 'package:pikachu_education/data/data_modal/data_question_modal.dart';
import 'package:pikachu_education/data/data_modal/data_user_modal.dart';
import '../../../../../../blog/blog_list_answer_page/list_answer_page_bloc.dart';
import '../../../../../../routes/page_name.dart';
import '../../../../../utils/management_image.dart';
import 'component/pop_up_menu_button.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({
    super.key,
    required this.index,
    required this.listAnswerPageBloc,
    required this.listDataAnswerFromSever,
    required this.currentUserInfo,
    required this.questionInfo,
    required this.contentController,
    required this.titleController,
    required this.editAnswerFormFieldKey,
  });

  final ListAnswerPageBloc listAnswerPageBloc;
  final List<DataAnswerModal> listDataAnswerFromSever;
  final DataUserModal currentUserInfo;
  final DataQuestionModal questionInfo;
  final GlobalKey<FormState> editAnswerFormFieldKey;
  final TextEditingController titleController;
  final TextEditingController contentController;
  final int index;

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  @override
  Widget build(BuildContext context) {
    var checkOwner = widget.currentUserInfo.userId ==
        widget.listDataAnswerFromSever[widget.index].userIdPost;
    return BlocProvider.value(
        value: widget.listAnswerPageBloc,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, PageName.detailAnswerPage,
                    arguments: [
                      widget.listDataAnswerFromSever[widget.index],
                      widget.currentUserInfo,
                      widget.questionInfo,
                      widget.listAnswerPageBloc
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
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              widget.listDataAnswerFromSever[widget.index]
                                  .answerTitle,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          PopUpMenuButtonAnswerPage(
                            listAnswerPageBloc: widget.listAnswerPageBloc,
                            questionInfo: widget.questionInfo,
                            answerInfo:
                                widget.listDataAnswerFromSever[widget.index],
                            editAnswerFormFieldKey:
                                widget.editAnswerFormFieldKey,
                            titleController: widget.titleController,
                            contentController: widget.contentController,
                            index: widget.index,
                            checkOwner: checkOwner,
                            dataAnswerFromServer:
                                widget.listDataAnswerFromSever,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        widget.listDataAnswerFromSever[widget.index]
                            .answerContent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.favorite_border,
                                ),
                                Text(
                                    '${widget.listDataAnswerFromSever[widget.index].numberLike} like'),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.comment_sharp),
                              Text(
                                  '${widget.listDataAnswerFromSever[widget.index].numberComment} comment'),
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
                                      ImageManagement.defaultAvatar,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                        widget
                                            .listDataAnswerFromSever[
                                                widget.index]
                                            .userNamePost,
                                        softWrap: false,
                                        overflow: TextOverflow.fade),
                                  ),
                                  Text(
                                      widget
                                          .listDataAnswerFromSever[widget.index]
                                          .timePost,
                                      style: const TextStyle(
                                          fontSize: 8,
                                          color: Color(0x4D000000)))
                                ],
                              ),
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
