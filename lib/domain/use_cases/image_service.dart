import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageService {
  Future<File?> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }
}
