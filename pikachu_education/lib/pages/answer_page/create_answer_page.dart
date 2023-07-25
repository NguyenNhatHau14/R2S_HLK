import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../models/content_add_model.dart';
import '../../service/service_home_page/add_question_service.dart';


Widget createAnswerPage(BuildContext context) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final formAddQuestionKey = GlobalKey<FormBuilderState>();
  return AlertDialog(
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
                          FormBuilderValidators.maxLength(10)
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Content'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.maxLength(10)
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                        final curState = formAddQuestionKey.currentState!;
                        var message = '';
                        curState.save();
                        if (curState.validate()) {
                          try {
                            await AddQuestionService.addDataToServer(
                              AddModalList(
                                  title: curState.value['title'],
                                  content: curState.value['content']),
                            );
                            Navigator.pop(context, curState);
                            message = 'add success';
                          } catch (error) {
                            message = 'Add task failed';
                            print(error);
                          }
                        } else {
                          message = 'Validation failed';
                          final snackBar = SnackBar(
                            content: Text(
                              message,
                              style: const TextStyle(fontSize: 20),
                            ),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
  );
}
