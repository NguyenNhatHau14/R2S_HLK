import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pikachu_education/utils/management_time.dart';
import '../../../../blog/blog_list_answer_page/list_answer_page_bloc.dart';
import '../../../../data/data_modal/data_answer_modal.dart';


class createAnswerPage extends StatefulWidget {
  const createAnswerPage({super.key,
    required this.listAnswerPageBloc,
    required this.questionId,
    required this.userIdOfQuestion, required this.currentUserId, required this.currentUserName});

  final ListAnswerPageBloc listAnswerPageBloc;
  final String userIdOfQuestion;
  final String questionId;
  final String currentUserName;
  final String currentUserId;

  @override
  State<createAnswerPage> createState() => _createAnswerPageState();
}

class _createAnswerPageState extends State<createAnswerPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final formAddQuestionKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.listAnswerPageBloc,
      child: BlocListener<ListAnswerPageBloc, ListAnswerPageState>(
        listener: (context, state) {
          if (state is PostAnswerSuccessState) {
            //ToDo
          }
        },
        child: BlocProvider.value(
          value: widget.listAnswerPageBloc,
          child: BlocListener<ListAnswerPageBloc, ListAnswerPageState>(
            listener: (context, state) {
              if(state is PostAnswerSuccessState){
                Navigator.pop(context);
              }
            },
            child: AlertDialog(
              backgroundColor: Color(0xFFFDFFAE),
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setStateForDialog) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'POST ANSWER',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        FormBuilder(
                          key: formAddQuestionKey,
                          child: Column(
                            children: [
                              FormBuilderTextField(
                                  controller: titleController,
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: 'Title'),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                  name: 'title'),
                              const SizedBox(
                                height: 16,
                              ),
                              FormBuilderTextField(
                                  controller: contentController,
                                  autofocus: false,
                                  maxLines: 8,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: 'Content'),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                  name: 'content')
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 165,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFDCA15),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Add Photo',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Icon(Icons.camera_alt_outlined),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 165,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            TextButton(
                                onPressed: () async {
                                  formAddQuestionKey.currentState!.validate();
                                  if (formAddQuestionKey.currentState!
                                      .validate() ==
                                      true) {
                                    var item = DataAnswerModal(
                                        userIdPost: widget.currentUserId,
                                        userNamePost: widget.currentUserName,
                                        answerId: '',
                                        timePost: ManagementTime.getTimePost(),
                                        answerContent: contentController.text,
                                        answerTitle: titleController.text,
                                        numberLike: 0);
                                    context.read<ListAnswerPageBloc>().add(
                                        PostAnswerEvent(
                                            userIdOfQuestion: widget
                                                .userIdOfQuestion,
                                            questionId: widget.questionId,
                                            itemToPost: item));
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 165,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFDCA15),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    'Create Answer',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
