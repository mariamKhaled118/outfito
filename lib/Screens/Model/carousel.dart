import 'dart:io';

import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CarouselDemo extends StatelessWidget {
  CarouselDemo(this.list);

  final List<XFile> list;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurvedCarouselDemo(list),
    );
  }
}

class CurvedCarouselDemo extends StatefulWidget {
  CurvedCarouselDemo(this.imageList);

  final List<XFile> imageList;

  @override
  State<CurvedCarouselDemo> createState() =>
      _CurvedCarouselDemoState(imageList);
}

class _CurvedCarouselDemoState extends State<CurvedCarouselDemo> {
  _CurvedCarouselDemoState(this.imageList);

  final List<XFile> imageList;

  @override
  Widget build(BuildContext context) {
    return CurvedCarousel(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 60,
          height: 60,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.primaries[index + 1 % Colors.primaries.length],
            shape: BoxShape.circle,
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.primaries[index + 1 % Colors.primaries.length],
                shape: BoxShape.circle,
              ),
              child: Image.file(
            File(imageList[index].path),
            fit: BoxFit.cover,
          )),
        );
      },
      itemCount: imageList.length,
      curveScale: -6,
      middleItemScaleRatio: 1.1,
      horizontalPadding: -15,
    );
  }
}
