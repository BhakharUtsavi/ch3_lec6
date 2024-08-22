import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TenTask extends StatefulWidget {
  const TenTask({super.key});

  @override
  State<TenTask> createState() => _TenTaskState();
}

class _TenTaskState extends State<TenTask> {

  final List<File?> _images = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(int index) async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _images[index] = File(pickedFile.path);
      });
    }
  }

  void _addImagePicker() {
    setState(() {
      _images.add(null); // Add a new image picker with a null image
    });
  }

  void _removeImagePicker(int index) {
    setState(() {
      _images.removeAt(index); // Remove the image picker at the specified index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Image Pickers')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _images[index] == null
                              ? Text('No image selected.')
                              : Image.file(_images[index]!),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () => _pickImage(index),
                                child: Text('Pick Image'),
                              ),
                              if (_images.length > 1)
                                ElevatedButton(
                                  onPressed: () => _removeImagePicker(index),
                                  child: Text('Remove'),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addImagePicker,
              child: Text('Add Image Picker'),
            ),
          ],
        ),
      ),
    );
  }
}
