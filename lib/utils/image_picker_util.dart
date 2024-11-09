import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker picker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    // Capture a photo.
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> pickImageFromGallery() async {
    // Pick an image.
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
