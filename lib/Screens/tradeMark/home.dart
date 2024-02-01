import 'package:flutter/material.dart';
import 'package:outfit/Screens/tradeMark/AppBar.dart';

import 'body.dart';


class tradeMark extends StatefulWidget {
  const tradeMark({super.key, required this.title});


  final String title;

  @override
  State<tradeMark> createState() => _tradeMarkState();
}

class _tradeMarkState extends State<tradeMark> {
  int _counter = 0;


    // if (result != null) {
    //   setState(() {
    //     selectedImages = result.files.map((file) => File(file.path)).toList();
    //   });
    // }



 // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: homeBar(title: 'Trade mark',),

      ),


      body: HomeBody(),

      // floatingActionButton: FloatingActionButton(
      //
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.




    );
  }
}
