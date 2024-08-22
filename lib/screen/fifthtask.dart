import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

class FifthTask extends StatefulWidget {
  const FifthTask({super.key});

  @override
  State<FifthTask> createState() => _FifthTaskState();
}

class _FifthTaskState extends State<FifthTask> {

  File? _imageFile;
  String? _fileName;
  String? _fileSize;
  String? _dimensions;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);

      // Get file name
      final fileName = pickedFile.name;

      // Get file size
      final fileSize = await imageFile.length();

      // Get image dimensions
      final img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;
      final width = image.width;
      final height = image.height;

      setState(() {
        _imageFile = imageFile;
        _fileName = fileName;
        _fileSize = '${fileSize / 1024} KB'; // Convert bytes to KB
        _dimensions = '$width x $height pixels';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Metadata'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            if (_imageFile != null) ...[
              Image.file(_imageFile!),
              SizedBox(height: 20),
              Text('File Name: $_fileName'),
              Text('File Size: $_fileSize'),
              Text('Dimensions: $_dimensions'),
            ],
          ],
        ),
      ),
    );
  }
}
