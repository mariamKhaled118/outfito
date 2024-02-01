import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class piece extends StatefulWidget {
  const piece({Key? key}) : super(key: key);

  @override
  State<piece> createState() => _PieceState();
}

class _PieceState extends State<piece> {
  File? _image;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF8F1),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          if (_image != null)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(_image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),

          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image uploading button
              Container(
                alignment: Alignment.center,
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15),),
                  color: Colors.grey.withOpacity(.5),
                ),
                child: IconButton(
                  onPressed: _pickImage,
                  icon: Icon(
                    FontAwesomeIcons.qrcode,

                    size: 60,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
