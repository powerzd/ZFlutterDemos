import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),
      body: Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        direction: Axis.horizontal,
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, "images");
            },
            child: Text("带占位图的图片"),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, "sliver");
            },
            child: Text("sliver"),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, "ListView");
            },
            child: Text("ListView"),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, "Paint");
            },
            child: Text("Paint"),
          ),
        ],
      ),
    );
  }

}