import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pikachu_education/data/data_modal/data_user_modal.dart';
import '../../../bloc/bloc_get_image_to_set_avatar/get_image_to_set_avatar_bloc.dart';
import '../../../bloc/bloc_profile_page/profile_page_bloc.dart';
import '../../../utils/management_image.dart';

class GetImageToSetAvatar extends StatefulWidget {
  const GetImageToSetAvatar({super.key, required this.currentUserInfo});

  final DataUserModal currentUserInfo;

  @override
  State<GetImageToSetAvatar> createState() => _GetImageToSetAvatarState();
}

File? _image;

class _GetImageToSetAvatarState extends State<GetImageToSetAvatar> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilePageBloc(),
      child: BlocBuilder<ProfilePageBloc, ProfilePageState>(
        builder: (context, state) {
          return BlocProvider(
            create: (context) => GetImageToSetAvatarBloc(),
            child:
            BlocListener<GetImageToSetAvatarBloc, GetImageToSetAvatarState>(
              listener: (context, state) {
                if (state is GetImageToCreateAnswerSuccess) {
                  setState(() {
                    _image = state.image;
                  });
                }
              },
              child: BlocListener<ProfilePageBloc, ProfilePageState>(
                listener: (context, state) {
                  if(state is PostAvatarSuccess){
                    Navigator.pop(context);
                  }
                },
                child: BlocBuilder<GetImageToSetAvatarBloc,
                    GetImageToSetAvatarState>(
                  builder: (context, state) {
                    return AlertDialog(
                      backgroundColor: Color(0xFFFDFFAE),
                      insetPadding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.zero,
                      content: StatefulBuilder(
                        builder: (BuildContext context,
                            StateSetter setStateForDialog) {
                          return SingleChildScrollView(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const Center(
                                  child: Text(
                                    'Pick Your Image',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                _image == null
                                    ? Image.asset(ManagementImage.logo)
                                    : Image.file(_image!),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all()),
                                  child: Column(children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Add Image By:',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            context
                                                .read<GetImageToSetAvatarBloc>()
                                                .add(
                                                GetImageToSetAvatarByGalleyEvent(
                                                    source:
                                                    ImageSource.gallery));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFFFDCA15),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                    child: const Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.all(8.0),
                                                          child: Text(
                                                            'Your Storage',
                                                            style: TextStyle(
                                                                color:
                                                                Colors.grey,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.photo_library,
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            context
                                                .read<GetImageToSetAvatarBloc>()
                                                .add(
                                                GetImageToSetAvatarByGalleyEvent(
                                                    source:
                                                    ImageSource.camera));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        color: Color(
                                                            0xFFFDCA15),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                    child: const Padding(
                                                      padding:
                                                      EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            'Your Camera',
                                                            style: TextStyle(
                                                                color:
                                                                Colors.grey,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .camera_alt_outlined,
                                                            color: Colors.grey,
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFD9D9D9),
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )),
                                    TextButton(
                                        onPressed: () async {
                                          context.read<ProfilePageBloc>().add(
                                              PostAvatarEvent(currentImageName: widget.currentUserInfo.avatarUrl??'',
                                                  userId: widget
                                                      .currentUserInfo.userId,
                                                  file: _image!));
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFDCA15),
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Update Avatar',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
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
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
