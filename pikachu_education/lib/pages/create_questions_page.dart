import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../models/content_add_model.dart';
import '../service/add_question_service.dart';

Widget createQuestionPage (BuildContext context){
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final formAddQuestionKey = GlobalKey<FormBuilderState>();
  return Padding(
    padding: MediaQuery.of(context).viewInsets,
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Center(
            child: Text(
              'N e w Q u e s t i o n',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
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
                    keyboardType: TextInputType
                        .text,
                    decoration:
                    const InputDecoration(
                        border:
                        OutlineInputBorder(),
                        labelText: 'Title'),
                    validator:
                    FormBuilderValidators
                        .compose([
                      FormBuilderValidators
                          .required(),
                      FormBuilderValidators
                          .maxLength(10)
                    ]),
                    name: 'title'),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                  controller: contentController,
                  autofocus: false,
                    maxLines: 8,
                    keyboardType: TextInputType
                        .text,
                    decoration:
                    const InputDecoration(
                        border:
                        OutlineInputBorder(),
                        labelText: 'Content'),
                    validator:
                    FormBuilderValidators
                        .compose([
                      FormBuilderValidators
                          .required(),
                      FormBuilderValidators
                          .maxLength(10)
                    ]),
                    name: 'content')
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red),
                  )),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color(
                            0xFFFDCA15)),
                    onPressed: () async {
                      final curState =
                      formAddQuestionKey
                          .currentState!;
                      var message = '';
                      curState.save();
                      if (curState.validate()) {
                        try {
                          await AddQuestionService
                              .addDataToServer(
                            AddModalList(
                                title: curState
                                    .value[
                                'title'],
                                content: curState
                                    .value[
                                'content']),
                          );
                          Navigator.pop(
                              context, curState);
                          message = 'add success';
                        } catch (error) {
                          message =
                          'Add task failed';
                          print(error);
                        }
                      } else {
                        message =
                        'Validation failed';
                        final snackBar = SnackBar(
                          content: Text(
                            message,
                            style:
                            const TextStyle(
                                fontSize: 20),
                          ),
                          backgroundColor:
                          Colors.red,
                        );
                        ScaffoldMessenger.of(
                            context)
                            .showSnackBar(
                            snackBar);
                      }
                    },
                    child: const Text(
                      'Add question',
                      style:
                      TextStyle(fontSize: 20),
                    )),
              )
            ],
          )
        ],
      ),
    ),
  );
}