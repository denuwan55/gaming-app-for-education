// reference - https://jeuler.medium.com/draggable-and-drag-drop-in-flutter-1765cb75b85
import 'package:flutter/material.dart';

class DragTargetWidget extends StatelessWidget {
  final void Function(Object)? onAccept;
  final bool Function(Object?)? onWillAccept;
  final Widget child;

  const DragTargetWidget({
    Key? key,
    required this.onAccept,
    required this.onWillAccept,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (context, data, rejectedData) {
        return child;
      },
      onWillAccept: onWillAccept,
      onAccept: onAccept,
    );
  }
}
