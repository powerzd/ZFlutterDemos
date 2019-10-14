import 'package:flutter/material.dart';

class SliverDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("sliverDemo"),
            floating: true,
            flexibleSpace: Image.network("http://g.hiphotos.baidu.com/image/pic/item/c2cec3fdfc03924590b2a9b58d94a4c27d1e2500.jpg",fit: BoxFit.fill,),
            expandedHeight: 200.0,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context,index)=>ListTile(title: Text("this is $index"),),childCount: 100),
          )
        ],
      ),
    );
  }

}