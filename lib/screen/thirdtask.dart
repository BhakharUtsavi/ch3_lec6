import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import XFile
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ThirdTask extends StatefulWidget {
  final String imageUrl;

  const ThirdTask({
    super.key,
    required this.imageUrl,
  });

  @override
  _ThirdTaskState createState() => _ThirdTaskState();
}

class _ThirdTaskState extends State<ThirdTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Preview'),
      ),
      body: Center(
        child: InteractiveViewer(
          minScale: 0.1,
          maxScale: 4.0,
          child: Image.network("https://tse1.mm.bing.net/th?id=OIP.1fsO82H3v8pgaeGXj_c0OAHaHa&pid=Api&P=0&h=180"),
        ),
      ),
    );
  }
}
