import 'package:ai_chat_bot/core/core.dart';


abstract class Shape{
  Offset begin;
  Offset end;
  Color color;
  PaintingStyle paintingStyle;
  StrokeType stroke;

  Shape({required this.begin , required this.end , this.color = Colors.black , this.paintingStyle = PaintingStyle.stroke,this.stroke = StrokeType.thin,});
}

class Line extends Shape{
  Line({required super.begin , required super.end , super.color , super.paintingStyle});
}

class Oval extends Shape{
  Oval({required super.begin , required super.end , super.color , super.paintingStyle});
}