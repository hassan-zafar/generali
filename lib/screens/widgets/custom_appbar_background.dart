import 'package:flutter/material.dart';

class CustomAppBarBackbround extends StatelessWidget {
  const CustomAppBarBackbround({
    this.backgroundColor = const Color(0xFFC5281B),
    this.height = 300,
    Key? key,
  }) : super(key: key);
  final Color backgroundColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CustomShape(),
      child: Container(
        height: height,
        color: backgroundColor,
      ),
    );
  }
}

class _CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double height = 160;
    final double width = size.width;
    final Path path = Path();
    path.lineTo(0, height - 70);
    path.quadraticBezierTo(width / 2, height, width, height - 70);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  // ignore: always_specify_types
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
