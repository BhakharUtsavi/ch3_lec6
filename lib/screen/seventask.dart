import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SevenTask extends StatefulWidget {
  const SevenTask({super.key});

  @override
  State<SevenTask> createState() => _SevenTaskState();
}

class _SevenTaskState extends State<SevenTask> {

  File? _profileImage;

  final ImagePicker _picker = ImagePicker();

  // Method to pick an image from the gallery or camera
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  // Method to remove the profile image
  void _removeImage() {
    setState(() {
      _profileImage = null;
    });
  }

  // Method to display the profile image in a circular avatar
  Widget _buildProfileImage() {
    if (_profileImage == null) {
      return CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey.shade300,
        child: Icon(Icons.person, size: 50, color: Colors.white),
      );
    } else {
      return CircleAvatar(
        radius: 50,
        backgroundImage: FileImage(_profileImage!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _pickImage,
          ),
          if (_profileImage != null)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: _removeImage,
            ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            _buildProfileImage(),
            SizedBox(height: 20),
            Text('Tap on the camera icon to pick an image'),
          ],
        ),
      ),
    );
  }
}
