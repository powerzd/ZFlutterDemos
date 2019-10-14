import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaintDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PaintDemoState();
  }

}

class _PaintDemoState extends State<PaintDemo>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: CustomPaint(
        painter:PaintView(context),
      ),
    );
  }

}

class PaintView extends CustomPainter{

  Paint _paint;
  BuildContext _context;

  PaintView(this._context){
    _paint = Paint();
    _paint.color = Colors.blue;
    _paint.style = PaintingStyle.stroke;
    _paint.isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(_context).size;
//    drawGrid(canvas, winSize);
//    drawCoo(canvas, Size(160, 320), winSize);
    drawBezier(canvas,winSize);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }

  Path getGridPath(int step,Size winSize){
    Path path = Path();
    for(int i = 0; i <winSize.height / step + 1; i++){
      path.moveTo(0, step * i.toDouble());
      path.lineTo(winSize.width, step * i.toDouble());
    }

    for(int i = 0; i < winSize.width / step + 1; i++){
      path.moveTo(step * i.toDouble(), 0);
      path.lineTo(step * i.toDouble(), winSize.height);
    }
    return path;
  }

  pathBezier(Size winSize){
    Path path = Path();
    path.moveTo(0, winSize.height / 2);
    path.quadraticBezierTo(winSize.width / 2, winSize.height, winSize.width, winSize.height / 2);
    return path;
  }

  pathCubic(Size size){
    Path path = Path();
    path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4, size.height / 4, size.width, size.height);
    return path;
  }

  drawBezier(Canvas canvas,Size winSize){
    Paint paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8.0;
    //canvas.drawPath(pathBezier(winSize), paint);
    canvas.drawPath(pathCubic(winSize), paint);
  }

  drawCoo(Canvas canvas,Size coo,Size winSize){
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    canvas.drawPath(cooPath(coo,winSize), paint);
    canvas.drawLine(new Offset(winSize.width, coo.height),
        new Offset(winSize.width - 10, coo.height - 6), paint);
    canvas.drawLine(new Offset(winSize.width, coo.height),
        new Offset(winSize.width - 10, coo.height + 6), paint);
    //下箭头
    canvas.drawLine(new Offset(coo.width, winSize.height-90),
        new Offset(coo.width - 6, winSize.height - 10-90), paint);
    canvas.drawLine(new Offset(coo.width, winSize.height-90),
        new Offset(coo.width + 6, winSize.height - 10-90), paint);

  }

  drawGrid(Canvas canvas,Size winSize,[int step = 20]){
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = Colors.blue;
    paint.isAntiAlias = true;
    canvas.drawPath(getGridPath(step, winSize), paint);
  }

  Path cooPath(Size coo, Size winSize){
    Path path = Path();
    path.moveTo(coo.width, coo.height);
    path.lineTo(winSize.width, coo.height);
    path.moveTo(coo.width, coo.height);
    path.lineTo(0, coo.height);

    //y负半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width, coo.height - winSize.height);
    //y负半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width, winSize.height);

    return path;
  }
}












