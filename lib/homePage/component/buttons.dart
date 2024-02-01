import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outfit/Screens/Measurements/measure.dart';
import 'package:outfit/Screens/originalPiece/QR%20check.dart';
import 'package:outfit/Screens/tradeMark/home.dart';


class ImageIconButton extends StatelessWidget {
  ImageIconButton({required this.words, required this.img, required this.s});

  final String words;
  final String img;
  final String s;

  void navigateToQR(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return piece();
        },
      ),
    );
  }
  void navigateToTry(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return measures();
        },
      ),
    );
  }
  void navigateToMark(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return tradeMark(title: 'Trade mark',);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image(
                image: AssetImage(img),
                height: 500,
                width: 500,
                fit: BoxFit.cover,
                color: Colors.white.withOpacity(0.4),
                // Adjust the opacity here (0.0 to 1.0)
                colorBlendMode: BlendMode.dstATop,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100.withOpacity(.3),
                ),
                child: Center(
                  child: Text(
                    words,
                    style: GoogleFonts.kadwa(
                      fontSize: 42,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 3.0),
                          // Set the offset of the shadow
                          blurRadius: 1.0,
                          // Set the blur radius of the shadow
                          color: Colors
                              .deepPurpleAccent.shade100, // Set the color of the shadow
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  s == 'qr'
                      ? navigateToQR(context)
                      : s == 'try'
                      ? navigateToTry(context)
                      : navigateToMark(context);
                },
                child:
                SizedBox.expand(), // Empty widget to fill the button area
              ),
            ),
          ],
        ),
      ),
    );
  }
}
