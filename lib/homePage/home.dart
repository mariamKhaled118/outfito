import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'AppBar.dart';
import 'component/buttons.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: homeBar(
          title: 'Smartfit',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.purple,
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: [

              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10),
                child: GradientText(
                  'Smartfit',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                  colors: [
                    Colors.purple,
                    Colors.deepPurple,
                  ],
                ),
              ),

              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10),
                child: GradientText(
                  'Fit your clothes with no effort ✨',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  colors: [
                    Colors.purple,
                    Colors.deepPurple,
                  ],
                ),
              ),




              SizedBox(
                width: double.infinity,
                height: 690,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 0,bottom: 50,right: 50,left: 50),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 35,
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      if (index == 0)
                        return ImageIconButton(
                          words: 'Trade mark',
                          img: 'assets/logo/logo.png',
                          s: 'mark',
                        );
                      else if (index == 1)
                        return ImageIconButton(
                          words: 'QR check',
                          img: 'assets/logo/Qr.png',
                          s: 'qr',
                        );
                      else if (index == 2)
                        return ImageIconButton(
                          words: 'Try on',
                          img: 'assets/logo/try.png',
                          s: 'try',
                        );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

