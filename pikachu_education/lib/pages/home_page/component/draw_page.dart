import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pikachu_education/blog/blog_detail_answer_page/detail_answer_page_bloc.dart';
import 'package:pikachu_education/blog/blog_home_page/data_home_bloc.dart';
import 'package:pikachu_education/data/data_modal/data_user_modal.dart';
import '../../../routes/page_name.dart';

class DrawPageForHomePage extends StatefulWidget {
  const DrawPageForHomePage(
      {super.key, required this.currentUserInfo, required this.dataHomePageBloc});

  final DataUserModal currentUserInfo;
  final DataHomePageBloc dataHomePageBloc;

  @override
  State<DrawPageForHomePage> createState() => _DrawPageForHomePageState();
}

class _DrawPageForHomePageState extends State<DrawPageForHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.dataHomePageBloc,
      child: BlocBuilder<DataHomePageBloc, DataHomePageState>(
        builder: (context, state) {
          return Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding:
              const EdgeInsets.only(top: 1, right: 8),
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
                      Navigator.pushNamed(
                          context, PageName.profilePage,
                          arguments: widget.currentUserInfo);
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
                  SpeedDialChild(
                    child: const Icon(Icons.logout),
                    label: 'Logout',
                    onTap: () async {
                      context.read<DataHomePageBloc>().add(LogoutEvent());
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
