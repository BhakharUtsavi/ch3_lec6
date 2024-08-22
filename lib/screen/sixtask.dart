import 'package:ch3_lec6/screen/six_next_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SixTask extends StatefulWidget {
  const SixTask({super.key});

  @override
  State<SixTask> createState() => _SixTaskState();
}

class _SixTaskState extends State<SixTask> {
  final _formKey = GlobalKey<FormState>();
  File? _image;

  // Method to pick an image
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  // Method to validate and proceed
  void _validateAndProceed() {
    if (_formKey.currentState!.validate()) {
      // Proceed to the next screen or step
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Six_Next_Page(image: _image!),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children:[
              SizedBox(height: 20),
              _image == null
                  ? Text('No image selected.')
                  : Image.file(_image!),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick an Image'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateAndProceed,
                child: Text('Proceed'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
