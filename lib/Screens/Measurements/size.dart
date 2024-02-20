import 'package:flutter/material.dart';
class size extends StatelessWidget
{
  size (this.x);
  String x;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        x ,
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}