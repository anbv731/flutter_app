
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter{
  double dx=4;
  List<String> textList=['text4444','text222','text333333','text4444'];

  @override
  void paint(Canvas canvas, Size size) {
    Path path1 = Path()
      ..lineTo(0, size.height)
      ..relativeLineTo(size.width/4-dx/2, 0)
      ..relativeLineTo(dx, -size.height)
      ..close();
    Path path2 = Path()
      ..moveTo(size.width/4+dx/2, 0)
      ..lineTo(size.width/4-dx/2, size.height)
      ..relativeLineTo(size.width/4, 0)
      ..relativeLineTo(dx, -size.height)
      ..close();
    Path path3 = Path()
      ..moveTo(size.width/2+dx/2, 0)
      ..lineTo(size.width/2-dx/2, size.height)
      ..relativeLineTo(size.width/4, 0)
      ..relativeLineTo(dx, -size.height)
      ..close();
    Path path4 = Path()
      ..moveTo(3*size.width/4+dx/2, 0)
      ..lineTo(3*size.width/4-dx/2, size.height)
      ..relativeLineTo(size.width/4+dx/2, 0)
      ..relativeLineTo(0, -size.height)
      ..close();

   
    final paintStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.indigo;

    final paintFill = [Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.red,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.orange,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.green];
    canvas.drawPath(path1, paintFill[0]);
    canvas.drawPath(path2, paintFill[1]);
    canvas.drawPath(path3, paintFill[2]);
    canvas.drawPath(path4, paintFill[3]);
   path3.addPath(path4, Offset.zero);
    path2.addPath(path3, Offset.zero);
    path1.addPath(path2, Offset.zero);



    canvas.drawPath(path1, paintStroke);

void myTextPainter (String text, int position) {
  final textStyle = TextStyle(
    color: Colors.black,
    fontSize: 10,
  );
  final textSpan = TextSpan(
    text: text,
    style: textStyle,
  );
  final textPainter = TextPainter(
    text: textSpan,
    textDirection: TextDirection.ltr,
  );
  textPainter.layout(
    minWidth: 0,
    maxWidth: size.width,
  );
  final xCenter = (position*size.width/4 +(size.width/4-textPainter.width)/2) ;
  final yCenter = (size.height - textPainter.height) / 2;
  final offset = Offset(xCenter, yCenter);
  textPainter.paint(canvas, offset);
}
for (int i=0;i<textList.length;i++){myTextPainter(textList[i], i);}

  }
  @override
  bool shouldRepaint(MyPainter oldDelegate)=>false;
}




