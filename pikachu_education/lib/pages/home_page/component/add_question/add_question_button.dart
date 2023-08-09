import 'package:flutter/material.dart';
import 'package:pikachu_education/data/data_modal/data_user_modal.dart';
import '../../../../../blog/blog_home_page/data_home_bloc.dart';
import 'create_question_dialog.dart';

class AddQuestionButton extends StatefulWidget {
  const AddQuestionButton({super.key,required this.dataHomeBloc,required this.currentUserInfo});

 final DataHomePageBloc dataHomeBloc;
 final DataUserModal currentUserInfo;

  @override
  State<AddQuestionButton> createState() => _AddQuestionButtonState();
}

class _AddQuestionButtonState extends State<AddQuestionButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
              color: const Color(0xFFFDCA15),
              borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) =>
                    createQuestionPage(
                       dataHomeBloc: widget.dataHomeBloc,userCurrentInfo:widget.currentUserInfo ),
              );
            },
            child: const Row(
              mainAxisAlignment:
              MainAxisAlignment.start,
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
    );
  }
}
