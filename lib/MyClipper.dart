import 'package:flutter/cupertino.dart';

class MyClipper extends CustomClipper<Path>{
  double dx=20;
  double between=2;
  double myHeight=100;
  @override
  Path getClip(Size size) {
    Path path1 = Path()
    ..lineTo(0, myHeight)
    ..relativeLineTo(size.width/4-between, 0)
    ..relativeLineTo(-dx, -myHeight)
    ..close();

    Path path2 = Path()
    ..relativeLineTo(dx, myHeight)
      ..relativeLineTo(size.width/4-between, 0)
      ..relativeLineTo(-dx,-myHeight)
      ..close();
    Path path3 = path2;
    Path path4=Path()
    ..relativeLineTo(dx, myHeight)
    ..relativeLineTo(size.width/4-between, 0)
    ..relativeLineTo(0, -myHeight)
    ..close();
    path3.addPath(path4, Offset(size.width/4,0));
    path2.addPath(path3, Offset(size.width/4,0));
    path1.addPath(path2, Offset(size.width/4,0));

    //

    return path1;
  }
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;
  }
