import 'package:bloc/bloc.dart';
import 'package:counter_bloc/bloc/image_picker/image_picker_events.dart';
import 'package:counter_bloc/bloc/image_picker/image_picker_states.dart';
import 'package:counter_bloc/utils/image_picker_util.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerStates()) {
    on<CameraCapture>(_cameraCapture);
  }

  void _cameraCapture(ImagePickerEvents events, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(mfile: file));
  }
}
