import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pikachu_education/bloc/bloc_get_image/get_image_bloc.dart';
import '../service/get_from_gallery_service/get_image.dart';

class GetImageDialog extends StatefulWidget {
  const GetImageDialog({super.key, required this.getImageBloc});

  final GetImageBloc getImageBloc;

  @override
  State<GetImageDialog> createState() => _GetImageDialogState();
}

class _GetImageDialogState extends State<GetImageDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.getImageBloc,
      child: BlocListener<GetImageBloc, GetImageState>(
        listener: (context, state) {
          if (state is GetImageSuccess) {
            Navigator.pop(context);
          }
        },
        child: AlertDialog(
          backgroundColor: const Color(0xFFFDFFAE),
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          content: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<GetImageBloc, GetImageState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const Center(
                      child: Text(
                        'Please Pick Your Image By',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  context.read<GetImageBloc>().add(
                                      GetImageByGalley(
                                          source: ImageSource.gallery));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 165,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFDCA15),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Row(
                                    children: [
                                      Text(
                                        'Your Storage',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.photo_library)
                                    ],
                                  ),
                                )),
                            TextButton(
                                onPressed: () async {
                                  context.read<GetImageBloc>().add(
                                      GetImageByGalley(
                                          source: ImageSource.camera));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 165,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFDCA15),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Row(
                                    children: [
                                      Text(
                                        'Your Camera',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.camera_alt_outlined)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 165,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text('Cancel',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                            )),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
