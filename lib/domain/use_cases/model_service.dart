import 'package:tflite/tflite.dart';

class ModelService {
  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/tflite/yolov2_tiny.tflite",
      labels: "assets/tflite/yolov2_tiny.txt",
    );
  }
}