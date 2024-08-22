import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SecondTask extends StatefulWidget {
  const SecondTask({super.key});

  @override
  State<SecondTask> createState() => _SecondTaskState();
}

class _SecondTaskState extends State<SecondTask> {

  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFiles = [];

  Future<void> _pickImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null) {
      setState(() {
        _imageFiles = selectedImages;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Image Picker'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _pickImages,
            child: Text('Pick Images'),
          ),
          Expanded(
            child: _imageFiles!.isEmpty
                ? Center(child: Text('No images selected.'))
                : SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < _imageFiles!.length; i += 3)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int j = i; j < i + 3 && j < _imageFiles!.length; j++)
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.all(4.0), // Adds spacing between images
                                width: MediaQuery.of(context).size.width / 3 - 8, // Adjust width for 3 images per row
                                height: MediaQuery.of(context).size.width / 3 - 8, // Adjust height to maintain a square
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(File(_imageFiles![j].path)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _imageFiles!.removeAt(j);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
