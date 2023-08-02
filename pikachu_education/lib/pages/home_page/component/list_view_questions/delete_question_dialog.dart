import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blog/bloc_home_page_test/data_home_page_bloc.dart';
import '../../../../blog/blog_home_page/data_home_bloc.dart';
import '../../../../data/demo_data/test_data_questions_modal.dart';



Widget deleteQuestion(
    {required BuildContext context,
    required DataQuestionModalTest itemHomePage,
    required DataHomeBloc dataHomePageBloc}) {
  return BlocProvider.value(
    value: dataHomePageBloc,
    child: BlocBuilder<DataHomeBloc, DataHomeState>(
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFDFFAE),
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          content: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'DELETE QUESTION',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
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
                          // context.read<DataHomeBloc>().add(
                          //     DeleteDataHomePage(idToDelete: itemHomePage));
                          // Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 165,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFFDCA15),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Delete',
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
