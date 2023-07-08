import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pikachu_education/pages/profile_page.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  backgroundColor: Colors.yellow[50],
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
                              child: Text('N e w Q u e s t i o n'),
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
                                      validator: FormBuilderValidators.compose([
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel')),
                                SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.yellow),
                                      onPressed: () {},
                                      child: const Text('Add question')),
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
              ))
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
