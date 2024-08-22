import 'dart:io'; // Import for File class
import 'package:flutter/material.dart';

class Six_Next_Page extends StatefulWidget {
  final File image;

  Six_Next_Page({required this.image});

  @override
  State<Six_Next_Page> createState() => _Six_Next_PageState();
}

class _Six_Next_PageState extends State<Six_Next_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Screen')),
      body: Center(
        child: Image.file(widget.image), // Use the passed image file
      ),
    );
  }
}
