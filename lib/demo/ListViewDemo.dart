import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListViewDemoState();
  }

}

class _ListViewDemoState extends State<ListViewDemo>{
  
  ScrollController _scrollController;
  bool isTop = true;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener((){
      if(_scrollController.offset > 500){
        setState(() {
          isTop = true;
        });
      }else if(_scrollController.offset < 300){
        setState(() {
          isTop = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          return ListTile(
            title: Text("this is $index"),
          );
        },
        itemCount: 100,
        controller: _scrollController,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_up),
        onPressed: (isTop ? (){
          _scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.ease);
        }:null),
      ),
    );
  }
}