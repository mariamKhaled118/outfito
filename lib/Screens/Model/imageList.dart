import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:outfit/Screens/Model/carousel.dart';

class imageList extends StatefulWidget {
  @override
  State<imageList> createState() => imageListState();
}

class imageListState extends State<imageList> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];

  void selectImages() async {
    final List<XFile> SelectedImages = await imagePicker.pickMultiImage();
    if (SelectedImages!.isNotEmpty) {
      imageFileList.addAll(SelectedImages);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      color: Colors.transparent,
      height: 215,
      child: Column(
        children: [
          imageFileList.isNotEmpty
            ?SizedBox(
              child: CarouselDemo(imageFileList),
              height: 120,
              width: MediaQuery.of(context).size.width,
            ):SizedBox(height: 120,)
          ,
          SizedBox(height: 10,),
          Center(
            child: MaterialButton(
              onPressed: () {
                selectImages();
              },
              child:button(Icons.upload, Alignment.bottomCenter),
            ),
          ),
        ],
      ),
    );
  }
  Widget button(IconData icon, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(
          left: 6,
          bottom: 20,
        ),
        height: 55,
        width: 55,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: CustomPaint(
            painter: DashedCircleBorderPainter(Colors.pink),
            child: Center(
              child: Icon(
                icon,
                color: Colors.blueGrey,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
class DashedCircleBorderPainter extends CustomPainter {
  DashedCircleBorderPainter(this.color){

  }
  Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final double radius = size.width / 2;

    // Draw dashed border using a circular path
    final Path path = Path();
    for (double i = 0; i < 360; i += 20) {
      final double startX = radius + radius * cos(i * 3.1415927 / 180);
      final double startY = radius + radius * sin(i * 3.1415927 / 180);

      final double endX = radius + radius * cos((i + 10) * 3.1415927 / 180);
      final double endY = radius + radius * sin((i + 10) * 3.1415927 / 180);

      path.moveTo(startX, startY);
      path.lineTo(endX, endY);
    }

    canvas.drawCircle(Offset(radius, radius), radius, paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
