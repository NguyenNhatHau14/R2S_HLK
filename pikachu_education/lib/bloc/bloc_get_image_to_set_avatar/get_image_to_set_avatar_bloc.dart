import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../service/get_from_gallery_service/get_image.dart';

part 'get_image_to_set_avatar_event.dart';
part 'get_image_to_set_avatar_state.dart';

class GetImageToSetAvatarBloc extends Bloc<GetImageToSetAvatarEvent, GetImageToSetAvatarState> {
  GetImageToSetAvatarBloc() : super(GetImageToSetAvatarInitial()) {
    on<GetImageToSetAvatarEvent>((event, emit) {
      // TODO: implement event handler
    });


    on<GetImageToSetAvatarByGalleyEvent>((event, emit) async {
      var image = await GetImageService.getImage(source: event.source);
      emit (GetImageToCreateAnswerSuccess(image: image));
    });
  }
}
