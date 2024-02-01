import 'package:flutter/material.dart';

class labelWidgt extends StatelessWidget{
  labelWidgt (var this.name);
  late var name;
  @override
  Widget build(BuildContext context){

    return Text(
      name,
      style: TextStyle(
        fontSize: 22,
        color: Colors.deepPurple,
      )
      ,

    );



  }



}