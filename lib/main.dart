import 'package:flutter/material.dart';
import 'package:flutter_demos/demo/DemoFadeInImage.dart';
import 'package:flutter_demos/demo/ListViewDemo.dart';
import 'package:flutter_demos/demo/SliverDemo.dart';
import 'package:flutter_demos/demo/paint/PaintDemo.dart';
import 'package:flutter_demos/home/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      routes: {
        "images":(context)=>DemoFadeInImage(),
        "sliver":(context)=>SliverDemo(),
        "ListView":(context)=>ListViewDemo(),
        "Paint":(context)=>PaintDemo(),
      },
    );
  }
}

