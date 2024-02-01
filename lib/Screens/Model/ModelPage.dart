import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class ImageListScreen extends StatefulWidget {
  @override
  _ImageListScreenState createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  List<File> selectedImages = [];

  Future<void> pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true, // Allow multiple selections
    );

    if (result != null) {
      setState(() {
        selectedImages = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
      ),
      body: ListView.builder(
        itemCount: selectedImages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.file(selectedImages[index]),
            title: Text('Image $index'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImages,
        child: Icon(Icons.add),
      ),
    );
  }
}
