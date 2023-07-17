import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../models/content_add_model.dart';
import '../../service/add_question_service.dart';

Widget createQuestionPage(BuildContext context) {
  final formAddQuestionKey = GlobalKey<FormBuilderState>();
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
                    autofocus: true,
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
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Subject'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.maxLength(10)
                    ]),
                    name: 'Subject'),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                    maxLines: 8,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Content'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.maxLength(10)
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
}
