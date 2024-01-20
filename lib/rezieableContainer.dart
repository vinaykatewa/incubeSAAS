import 'package:flutter/material.dart';

class ResizableContainer extends StatefulWidget {
  final Widget child;

  ResizableContainer({required this.child});

  @override
  _ResizableContainerState createState() => _ResizableContainerState();
}

class _ResizableContainerState extends State<ResizableContainer> {
  double _width = 200.0;
  double _height = 200.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          _width += details.delta.dx;
          _height += details.delta.dy;
        });
      },
      child: Container(
        width: _width,
        height: _height,
        child: widget.child,
      ),
    );
  }
}
