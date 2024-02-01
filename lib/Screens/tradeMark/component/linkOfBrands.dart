import 'package:flutter/material.dart';

class LinkBrand extends StatefulWidget {
  final String? brandName;
  final String? brandGender;
  final ImageProvider image;

  LinkBrand({
    super.key,
    required this.brandName,
    required this.brandGender,
    required this.image,
  });

  @override
  _LinkBrandState createState() => _LinkBrandState();
}

class _LinkBrandState extends State<LinkBrand> {
  bool isLongPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {

        setState(() {
          isLongPressed = true;
        });
      },
      onLongPressUp: () {
        setState(() {
          isLongPressed = false;
        });
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double containerWidth = constraints.maxWidth;
          double containerHeight = containerWidth; // Height matches the width

          return Container(
            width: containerWidth,
            height: containerHeight,
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: widget.image,
                fit: BoxFit.cover,
              ),
            ),
            child: Card(
              color: isLongPressed
                  ? Colors.purple.shade50.withOpacity(.8)
                  : Colors.purple.shade50.withOpacity(.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadowColor: Colors.black54,
              child: Row(
                children: [
                  SizedBox(
                    width: containerWidth-8,
                    height: containerHeight,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment:
                            isLongPressed
                        ?CrossAxisAlignment.start
                        :CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isLongPressed
                          ?Text(" " + widget.brandName!,
                              softWrap: true,
                              maxLines: 3,
                              style: TextStyle(
                                color: isLongPressed
                                    ? Colors.black.withOpacity(.8)
                                    : Colors.black,
                                fontSize: containerHeight / 8,
                              ))
                          :SizedBox(),


                          isLongPressed
                          ?Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(widget.brandGender!,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                    color: isLongPressed
                                        ? Colors.black54
                                        : Colors.black87,
                                    fontSize: containerHeight / 14)),
                          )
                          :SizedBox(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
