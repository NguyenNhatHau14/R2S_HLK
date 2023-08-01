import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pikachu_education/models/content_add_model.dart';
import 'package:pikachu_education/pages/authentication/profile_page/profile_page.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../service/service_home_page/add_question_service.dart';


class HomePageTest extends StatelessWidget {
  HomePageTest({
    super.key,
  });

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Image.asset('assets/image/logo.png'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: const Color(0xFFFDFFAE),
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) {
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
                                key: _formKey,
                                child: Column(
                                  children: [
                                    FormBuilderTextField(
                                        autofocus: true,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Title'),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxLength(10)
                                        ]),
                                        name: 'title'),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    FormBuilderTextField(
                                        maxLines: 8,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Content'),
                                        validator:
                                            FormBuilderValidators.compose([
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
                                            fontSize: 20, color: Colors.red),
                                      )),
                                  SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFFFDCA15)),
                                        onPressed: () async {
                                          final curState =
                                              _formKey.currentState!;
                                          var message = '';
                                          curState.save();
                                          if (curState.validate()) {
                                            try {
                                              await AddQuestionService
                                                  .addDataToServer(
                                                AddModalList(
                                                    title:
                                                        curState.value['title'],
                                                    content: curState
                                                        .value['content']),
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
                                                style: const TextStyle(
                                                    fontSize: 20),
                                              ),
                                              backgroundColor: Colors.red,
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        },
                                        child: const Text(
                                          'Add question',
                                          style: TextStyle(fontSize: 20),
                                        )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                )),
          ],
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.menu,
          foregroundColor: Colors.black,
          activeIcon: Icons.close,
          backgroundColor: Colors.yellow,
          children: [
            SpeedDialChild(
              backgroundColor: Colors.red,
              child: const Icon(Icons.people),
              label: 'Profile',
              labelBackgroundColor: Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
            ),
            SpeedDialChild(
              backgroundColor: Colors.grey,
              child: const Icon(Icons.settings),
              label: 'Settings',
              labelBackgroundColor: Colors.grey,
              onTap: () {
                // Handle Phone menu action
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.camera),
              label: 'Camera',
              onTap: () {
                // Handle Camera menu action
              },
            ),
          ],
        ),
        body: const Center(
          child: Text('Home Page Content'),
        ),
    );
  }
}
