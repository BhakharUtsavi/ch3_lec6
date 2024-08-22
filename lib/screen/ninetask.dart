import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

class NineTask extends StatefulWidget {
  const NineTask({super.key});

  @override
  State<NineTask> createState() => _NineTaskState();
}

class _NineTaskState extends State<NineTask> {

  File? _originalImageFile;
  File? _compressedImageFile;
  String? _originalFileSize;
  String? _compressedFileSize;
  Image? _compressedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickAndCompressImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      final originalFileSize = await imageFile.length();

      // Load image using the image package
      final img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;

      // Compress image
      final img.Image compressedImage = img.copyResize(image, width: 800); // Resize to a smaller width (e.g., 800)
      final compressedImageBytes = img.encodeJpg(compressedImage, quality: 85); // Compress to JPEG with quality 85
      final Directory tempDir = await getTemporaryDirectory();
      final String tempPath = '${tempDir.path}/compressed_image.jpg';
      final File compressedImageFile = File(tempPath)..writeAsBytesSync(compressedImageBytes);

      final compressedFileSize = await compressedImageFile.length();

      setState(() {
        _originalImageFile = imageFile;
        _compressedImageFile = compressedImageFile;
        _originalFileSize = '${originalFileSize / 1024} KB'; // Convert bytes to KB
        _compressedFileSize = '${compressedFileSize / 1024} KB'; // Convert bytes to KB
        _compressedImage = Image.file(compressedImageFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Compression'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickAndCompressImage,
              child: Text('Pick and Compress Image'),
            ),
            if (_originalImageFile != null) ...[
              Text('Original File Size: $_originalFileSize'),
              Image.file(_originalImageFile!),
              SizedBox(height: 20),
              Text('Compressed File Size: $_compressedFileSize'),
              if (_compressedImageFile != null) _compressedImage!,
            ],
          ],
        ),
      ),
    );
  }
}
