import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:outfit/Screens/Measurements/measure.dart';
import 'package:outfit/Screens/Model/virtualTryOn.dart';
import 'package:outfit/Screens/originalPiece/QR%20check.dart';
import 'package:outfit/Screens/tradeMark/home.dart';

class welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController.unbounded(vsync: this)
      ..repeat(
        min: -.5,
        max: 1.5,
        period: Duration(seconds: 1),
      );
  }


  List images = [
    "assets/welcome/first.jpg",
    "assets/welcome/measurments.jpg",
    "assets/welcome/scan2.jpg",
    "assets/welcome/ScanMe1.jpeg",
  ];
  List texts = [
    [
      "Store",
      "Shopping pleasure",
      "how are you doing in this website i hope you are interesting here"
    ],
    [
      "Measurement",
      "Fit clothes",
      "how are you doing in this website i hope you are interesting here"
    ],
    [
      "Try on",
      "Less effort",
      "how are you doing in this website i hope you are interesting here"
    ],
    [
      "Scan me",
      "Detect Original",
      "how are you doing in this website i hope you are interesting here"
    ],
  ];
  List path = [tradeMark(title: "Outfit"), measures(), MainScreen(),piece()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (_, index) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black26.withOpacity(.2),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 20, top: 80, right: 40),
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 400),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(300)),
                        gradient: RadialGradient(
                          center: Alignment(-0.9, 0.9), // near the top right
                          radius: .9,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(.8),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, -10),
                              blurRadius: 20,
                              spreadRadius: 4)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          texts[index][0],
                          style: TextStyle(
                            color: Colors.black.withOpacity(.9),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        Text(
                          texts[index][1],
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          texts[index][2],
                          style: TextStyle(
                            height: 1.2,
                            color: Colors.black45,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                colors: [Colors.purple, Colors.deepPurple]),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return path[index];
                                  },
                                ),
                              );
                            },
                            child: AnimatedBuilder(
                              animation: _animationController,
                              builder: (_, child) {
                                return ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    transform: arrowTransforrm(
                                        _animationController.value),
                                    colors: const [
                                      Colors.white10,
                                      Colors.white,
                                      Colors.white10
                                    ],
                                  ).createShader(bounds),
                                  child: child,
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    widthFactor: .4,
                                    child: Icon(
                                      FontAwesomeIcons.caretRight,
                                      color: Colors.white,
                                      size: 23,
                                    ),
                                  ),
                                  Align(
                                    widthFactor: .4,
                                    child: Icon(
                                      FontAwesomeIcons.caretRight,
                                      color: Colors.white,
                                      size: 23,
                                    ),
                                  ),
                                  Align(
                                    widthFactor: .4,
                                    child: Icon(
                                      FontAwesomeIcons.caretRight,
                                      color: Colors.white,
                                      size: 23,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  Positioned(
                    right: 10,
                    top: 40,
                    child: Container(
                      height: 70,
                      width: 10,
                      child: Column(
                        children: List.generate(images.length, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index==indexDots?25:10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index==indexDots?Colors.deepPurple:Colors.deepPurple.withOpacity(.4)
                            ),
                          );
                        }),

                      ),
                    ),
                  ),



                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.vertical,
        itemCount: images.length,
      ),
    );

    throw UnimplementedError();
  }
}

class arrowTransforrm extends GradientTransform {
  final double percent;

  arrowTransforrm(this.percent);

  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(0, bounds.height * percent, 0);
  }
}
