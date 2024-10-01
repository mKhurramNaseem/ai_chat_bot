import 'dart:developer';
import 'dart:ui';

import 'package:ai_chat_bot/core/core.dart';

import '../../../../domain/entities/custom_line.dart';
import '../../../../domain/entities/quadrilateral.dart';
import '../../../../domain/entities/triangle.dart';

class IepPainter extends CustomPainter {
  static const _borderRadius = 20.0;

  final bool drawEnable;
  final List<Shape> track;
  final Shape shape;

  IepPainter({
    required this.shape,
    required this.track,
    required this.drawEnable,
  });

  @override
  void paint(Canvas canvas, Size size) {    
    if(drawEnable){
      log('Track : ${track.toString()}');
      for (var i = 0; i < track.length; i++) {
      drawRespectiveShape(canvas, track[i]);
    }
    drawRespectiveShape(canvas, shape);
    }    
  }

  @override
  bool shouldRepaint(IepPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(IepPainter oldDelegate) => false;

  drawRespectiveShape(Canvas canvas, Shape shape) {    
    if (shape is Line) {
      drawLine(canvas, shape);
    } else if (shape is Oval) {
      drawOval(canvas, shape);
    } else if (shape is Rectangle) {
      drawRectangle(canvas, shape);
    } else if (shape is RRectangle) {
      drawRRectangle(canvas, shape);
    } else if (shape is Pentagon) {
      drawPentagon(canvas, shape);
    } else if (shape is Hexagon) {
      drawHexagon(canvas, shape);
    } else if (shape is Isoceles) {
      drawIsocelesTriangle(canvas, shape);
    } else if (shape is Line) {
      drawLine(canvas, shape);
    } else if (shape is CustomLine) {
      drawCustomLine(canvas, shape);
    }
  }

  drawLine(Canvas canvas, Line line) {
    double strokeWidth = getValueFromStrokePixel(line.stroke);
    Paint paint = Paint()
      ..color = line.color
      ..strokeWidth = strokeWidth
      ..style = line.paintingStyle;
    canvas.drawLine(line.begin, line.end, paint);    
    // canvas.drawLine(line.end, , paint);
  }

  drawOval(Canvas canvas, Oval oval) {
    double strokeWidth = getValueFromStrokePixel(oval.stroke);
    Paint paint = Paint()
      ..color = oval.color
      ..strokeWidth = strokeWidth
      ..style = oval.paintingStyle;
    canvas.drawOval(Rect.fromPoints(oval.begin, oval.end), paint);
  }

  drawRectangle(Canvas canvas, Rectangle rectangle) {
    double strokeWidth = getValueFromStrokePixel(rectangle.stroke);
    Paint paint = Paint()
      ..color = rectangle.color
      ..strokeWidth = strokeWidth
      ..style = rectangle.paintingStyle;
    canvas.drawRect(Rect.fromPoints(rectangle.begin, rectangle.end), paint);
  }

  drawRRectangle(Canvas canvas, RRectangle rRectangle) {
    double strokeWidth = getValueFromStrokePixel(rRectangle.stroke);
    Paint paint = Paint()
      ..color = rRectangle.color
      ..strokeWidth = strokeWidth
      ..style = rRectangle.paintingStyle;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromPoints(rRectangle.begin, rRectangle.end),
            const Radius.circular(_borderRadius)),
        paint);
  }

  drawPentagon(Canvas canvas, Pentagon pentagon) {
    double strokeWidth = getValueFromStrokePixel(pentagon.stroke);
    Paint paint = Paint()
      ..color = pentagon.color
      ..strokeWidth = strokeWidth
      ..style = pentagon.paintingStyle;
    Rect rect = Rect.fromPoints(pentagon.begin, pentagon.end);
    final topCenter = rect.topCenter;
    final centerRight = rect.centerRight;
    final centerLeft = rect.centerLeft;
    final bottomLeft = getMidPoint(rect.bottomLeft, rect.bottomCenter);
    final bottomRight = getMidPoint(rect.bottomCenter, rect.bottomRight);
    Path path = Path()
      ..moveTo(topCenter.dx, topCenter.dy)
      ..lineTo(centerLeft.dx, centerLeft.dy)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy)
      ..lineTo(centerRight.dx, centerRight.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  drawHexagon(Canvas canvas, Hexagon hexagon) {
    double strokeWidth = getValueFromStrokePixel(hexagon.stroke);
    Paint paint = Paint()
      ..color = hexagon.color
      ..strokeWidth = strokeWidth
      ..style = hexagon.paintingStyle;
    Rect rect = Rect.fromPoints(hexagon.begin, hexagon.end);
    final topCenter = rect.topCenter;
    final bottomCenter = rect.bottomCenter;
    final rightFirst = getMidPoint(rect.topRight, rect.centerRight);
    final rightSecond = getMidPoint(rect.centerRight, rect.bottomRight);
    final leftFirst = getMidPoint(rect.topLeft, rect.centerLeft);
    final leftSecond = getMidPoint(rect.centerLeft, rect.bottomLeft);
    Path path = Path()
      ..moveTo(topCenter.dx, topCenter.dy)
      ..lineTo(leftFirst.dx, leftFirst.dy)
      ..lineTo(leftSecond.dx, leftSecond.dy)
      ..lineTo(bottomCenter.dx, bottomCenter.dy)
      ..lineTo(rightSecond.dx, rightSecond.dy)
      ..lineTo(rightFirst.dx, rightFirst.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  drawIsocelesTriangle(Canvas canvas, Isoceles isoceles) {
    double strokeWidth = getValueFromStrokePixel(isoceles.stroke);
    Paint paint = Paint()
      ..color = isoceles.color
      ..strokeWidth = strokeWidth
      ..style = isoceles.paintingStyle;
    Rect rect = Rect.fromPoints(isoceles.begin, isoceles.end);
    final topCenter = rect.topCenter;
    final bottomLeft = rect.bottomLeft;
    final bottomRight = rect.bottomRight;
    Path path = Path()
      ..moveTo(topCenter.dx, topCenter.dy)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  drawScaleneTriangle(Canvas canvas, Scalene scalene) {
    double strokeWidth = getValueFromStrokePixel(scalene.stroke);
    Paint paint = Paint()
      ..color = scalene.color
      ..strokeWidth = strokeWidth
      ..style = scalene.paintingStyle;
    Rect rect = Rect.fromPoints(scalene.begin, scalene.end);
    final topLeft = rect.topLeft;
    final bottomLeft = rect.bottomLeft;
    final bottomRight = rect.bottomRight;
    Path path = Path()
      ..moveTo(topLeft.dx, topLeft.dy)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  drawCustomLine(Canvas canvas, CustomLine customLine) {
    double strokeWidth = getValueFromStrokePixel(customLine.stroke);
    Paint paint = Paint()
      ..color = customLine.color
      ..strokeWidth = strokeWidth
      ..style = customLine.paintingStyle;
    PointMode pointMode = PointMode.polygon;
    canvas.drawPoints(pointMode, customLine.offsets, paint);
  }

  Offset getMidPoint(Offset first, Offset second) {
    double x = (first.dx + second.dx) / 2;
    double y = (first.dy + second.dy) / 2;
    return Offset(x, y);
  }

  double getValueFromStrokePixel(StrokeType stroke) {
    return switch (stroke) {
      StrokeType.thin => 5.0,
      StrokeType.medium => 10.0,
      StrokeType.thick => 15.0,
    };
  }
}
