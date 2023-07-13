import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pikachu_education/data/data_questions.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import '../data/data_image.dart';
import '../models/content_add_model.dart';
import '../routes/page_name.dart';
import '../service/add_question_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formAddQuestionKey = GlobalKey<FormBuilderState>();
  final TextEditingController searchController = TextEditingController();
  bool showAddQuestionButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logoImage.image),
            ],
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 1, right: 8),
                  child: SpeedDial(
                    icon: Icons.menu,
                    iconTheme: const IconThemeData(size: 35),
                    foregroundColor: Colors.black,
                    activeIcon: Icons.close,
                    backgroundColor: const Color(0xFFFDCA15),
                    buttonSize: const Size(50, 48),
                    direction: SpeedDialDirection.down,
                    children: [
                      SpeedDialChild(
                        backgroundColor: Colors.red,
                        child: const Icon(Icons.people),
                        label: 'Profile',
                        labelBackgroundColor: Colors.red,
                        onTap: () {
                          Navigator.pushNamed(context, PageName.profilePage);
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
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: Color(0xFFFDCA15),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: const Color(0xFFFDFFAE),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
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
                                      key: _formAddQuestionKey,
                                      child: Column(
                                        children: [
                                          FormBuilderTextField(
                                              autofocus: true,
                                              keyboardType: TextInputType.text,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Title'),
                                              validator: FormBuilderValidators
                                                  .compose([
                                                FormBuilderValidators
                                                    .required(),
                                                FormBuilderValidators.maxLength(
                                                    10)
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
                                              validator: FormBuilderValidators
                                                  .compose([
                                                FormBuilderValidators
                                                    .required(),
                                                FormBuilderValidators.maxLength(
                                                    10)
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
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xFFFDCA15)),
                                              onPressed: () async {
                                                final curState =
                                                    _formAddQuestionKey
                                                        .currentState!;
                                                var message = '';
                                                curState.save();
                                                if (curState.validate()) {
                                                  try {
                                                    await AddQuestionService
                                                        .addDataToServer(
                                                      AddModalList(
                                                          title: curState
                                                              .value['title'],
                                                          content:
                                                              curState.value[
                                                                  'content']),
                                                    );
                                                    Navigator.pop(
                                                        context, curState);
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.add,
                            size: 35,
                            color: Colors.black,
                          ),
                          Text(
                            'Add Question',
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SizedBox(
                    height: 50,
                    child: AnimSearchBar(
                      boxShadow: true,
                      width: MediaQuery.of(context).size.width,
                      helpText: 'Search Question',
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 35,
                      ),
                      textController: searchController,
                      onSuffixTap: () {
                        setState(() {
                          searchController.clear();
                        });
                      },
                      textFieldColor: Color(0xFFFDFFAE),
                      color: Color(0xFFFDCA15),
                      onSubmitted: (p0) {},
                      animationDurationInMilli: 2000,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: mockListQuestion.length,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.transparent,
                thickness: 0,
              ),
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, PageName.listAnswerPage);
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
                              padding: const EdgeInsets.only(
                                  top: 8, right: 8, left: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                      'assets/image/pikachu_itachi.png'),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            mockListQuestion[index].userName ??
                                                '',
                                            style: TextStyle(fontSize: 15)),
                                        Text(
                                            '${mockListQuestion[index].timeAgo ?? 0} day ago',
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Color(0x4D000000))),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8, left: 8),
                              child: Row(
                                children: [
                                  Icon(Icons.tag),
                                  Text(
                                    mockListQuestion[index].tag ?? '',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, right: 8, left: 8),
                              child: Text(mockListQuestion[index].title ?? '',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, right: 8, left: 8),
                              child: Text(mockListQuestion[index].content ?? '',
                                  style: TextStyle(fontSize: 12)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, right: 8, left: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        child: Row(
                                      children: [
                                        Text(
                                            '${mockListQuestion[index].numberAnswer}'),
                                        Icon(Icons.message)
                                      ],
                                    )),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      mockListQuestion[index].favorite =
                                          !(mockListQuestion[index].favorite);

                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          child: Row(
                                        children: [
                                          Text(
                                              '${mockListQuestion[index].numberLike}'),
                                          Icon(mockListQuestion[index].favorite
                                              ? Icons.favorite
                                              : Icons.favorite_border)
                                        ],
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
        ]),
      ),
    );
  }
}
