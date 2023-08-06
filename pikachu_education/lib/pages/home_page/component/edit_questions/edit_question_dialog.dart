import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pikachu_education/utils/management_time.dart';
import '../../../../blog/blog_home_page/data_home_bloc.dart';
import '../../../../data/data_modal/data_question_modal.dart';

Widget editQuestion(
    {required BuildContext context,
    required DataQuestionModal itemHomePage,
    required DataHomeBloc dataHomePageBloc}) {
  TextEditingController titleController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  titleController.text = itemHomePage.questionTitle ?? '';
  subjectController.text = itemHomePage.questionSubject ?? '';
  contentController.text = itemHomePage.questionContent ?? '';
  final formAddQuestionKey = GlobalKey<FormBuilderState>();
  return BlocProvider.value(
    value: dataHomePageBloc,
    child: BlocBuilder<DataHomeBloc, DataHomeState>(
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFDFFAE),
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          alignment: Alignment.topCenter,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          content: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'EDIT QUESTION',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
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
                          controller: subjectController,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelText: 'Subject'),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          name: 'Subject'),
                      const SizedBox(
                        height: 16,
                      ),
                      FormBuilderTextField(
                          controller: contentController,
                          maxLines: 8,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelText: 'Content'),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          name: 'content')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
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
                          if (formAddQuestionKey.currentState!.validate() ==
                              true) {
                            var item = DataQuestionModal(
                              timePost: ManagementTime.getTimePost(),
                              questionId: '',
                                userId: itemHomePage.userId,
                                userName: itemHomePage.userName,
                                questionTitle: titleController.text,
                                questionSubject: subjectController.text,
                                questionContent: contentController.text,
                                numberLike: itemHomePage.numberLike,
                                numberAnswer: itemHomePage.numberAnswer);
                            // context
                            //     .read<DataHomeBloc>()
                            //     .add(UpdateDataHomePage(dataToUpdate: item));
                            // Navigator.pop(context);
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
                            'Edit Question',
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
          ),
        );
      },
    ),
  );
}
