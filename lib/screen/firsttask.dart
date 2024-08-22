import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FirstTask extends StatefulWidget {
  const FirstTask({super.key});

  @override
  State<FirstTask> createState() => _FirstTaskState();
}

class _FirstTaskState extends State<FirstTask> {
  File? _image;
  bool _isCamera = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: _isCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image == null
              ? Text('No image selected.')
              : Image.file(
            _image!,
            height: 200,
            width: 500,
          ),
          SizedBox(height: 20),
          SwitchListTile(
            title: Text('Use Camera'),
            value: _isCamera,
            onChanged: (bool value) {
              setState(() {
                _isCamera = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text(_isCamera ? 'Capture Image' : 'Pick Image'),
          ),
        ],
      ),
    );
  }
}
