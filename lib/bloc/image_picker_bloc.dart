import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_with_bloc/bloc/image_picker_event.dart';
import 'package:image_picker_with_bloc/bloc/image_picker_state.dart';
import 'package:image_picker_with_bloc/utils/image-picker-utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCaptureEvent>(cameraCapture);
    // on<CameraCaptureEvent>(galleryCapture);
  }
  void cameraCapture(
      CameraCaptureEvent event, Emitter<ImagePickerState> states) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void galleryCapture(
      CameraCaptureEvent event, Emitter<ImagePickerState> states) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}
