import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pikachu_education/data/data_modal/data_user_modal.dart';
import '../../../../../blog/blog_home_page/data_home_bloc.dart';
import '../../../../../data/data_modal/data_question_modal.dart';
import '../../../../utils/management_time.dart';
import 'component/list_subject.dart';

class createQuestionPage extends StatefulWidget {
  const createQuestionPage(
      {super.key, required this.dataHomeBloc, required this.userCurrentInfo});

  final DataHomePageBloc dataHomeBloc;
  final DataUserModal userCurrentInfo;

  @override
  State<createQuestionPage> createState() => _createQuestionPageState();
}

class _createQuestionPageState extends State<createQuestionPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final formAddQuestionKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    titleController.dispose();
    subjectController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.dataHomeBloc,
      child: BlocBuilder<DataHomePageBloc, DataHomePageState>(
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
                      'N e w Q u e s t i o n',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                        DropdownButtonFormField(
                          validator: FormBuilderValidators.required(),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          icon:
                              const Icon(Icons.arrow_drop_down_circle_outlined),
                          hint: const Text('Subject'),
                          items: DataAddQuestion.listSubject
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              subjectController.text = value ?? '';
                              print(subjectController.text);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        FormBuilderTextField(
                            controller: contentController,
                            maxLines: 8,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
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
                                questionContent: contentController.text,
                                questionSubject: subjectController.text,
                                questionTitle: titleController.text,
                                numberLike: 0,
                                questionId: '',
                                userName: '',
                                userId: '',
                              );
                              context.read<DataHomePageBloc>().add(
                                  PostDataQuestionsEvent(
                                      dataToPost: item,
                                      userId: widget.userCurrentInfo.userId));
                              Navigator.pop(context);
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
                              'Create Question',
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
}
