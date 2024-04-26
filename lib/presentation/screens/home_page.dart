import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontiers_market_interview/domain/use_cases/image_service.dart';
import 'package:frontiers_market_interview/domain/use_cases/model_service.dart';
import 'package:frontiers_market_interview/presentation/screens/user_profile_page.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  List? _recognitions;
  final modelService = ModelService();
  final imageService = ImageService();

  @override
  void initState() {
    super.initState();
    modelService.loadModel();
  }

  Future<void> _pickImage() async {
    final image = await imageService.pickImage();
    if (image == null) return;
    setState(() => _image = File(image.path));
    _recognizeImage();
  }

  Future<void> _recognizeImage() async {
    final recognitions = await Tflite.detectObjectOnImage(
        path: _image!.path,
        model: "YOLO",
        threshold: 0.3,
        imageMean: 0.0,
        imageStd: 255.0,
        numResultsPerClass: 1);
    setState(() => _recognitions = recognitions);
  }

  List<Widget> renderBoxes() {
    if (_recognitions == null) return [];
    double factorX = MediaQuery.of(context).size.width;
    double factorY = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height) *
        MediaQuery.of(context).size.width;

    return _recognitions!.map((re) {
      return Positioned(
        left: re["rect"]["x"] * factorX,
        top: re["rect"]["y"] * factorY,
        width: re["rect"]["w"] * factorX,
        height: re["rect"]["h"] * factorY,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.red,
              width: 3,
            ),
          ),
          child: Padding(
            // Add some padding
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
              style: TextStyle(
                background: Paint()..color = Colors.red,
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Courier',
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Cattle Detector',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto', // Change this to your preferred sleek font
            fontWeight: FontWeight.bold, // Lighter font weight for a sleek look
            fontSize: 24, // Adjust the size as needed
          ),
        ),
        backgroundColor: Colors.black, // Set AppBar color to black
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? const Text('No image selected.')
                : Stack(
                    children: [
                      Image.file(_image!),
                      ...renderBoxes(),
                    ],
                  ),
            ElevatedButton(
              onPressed: _pickImage,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.black.withOpacity(0.7)),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0)),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(fontFamily: 'Roboto')),
              ),
              child: const Text(
                'Pick Image',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
