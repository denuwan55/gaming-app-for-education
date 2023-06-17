// reference - https://jeuler.medium.com/draggable-and-drag-drop-in-flutter-1765cb75b85

import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  final Widget child;
  final Object data;

  const DraggableWidget({
    super.key,
    required this.child,
    required this.data,
  });

  @override
  State<DraggableWidget> createState() {
    return _DraggableWidgetState();
  }
}

class _DraggableWidgetState extends State<DraggableWidget> {
  bool _isDropped = false;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: widget.child, // The dragged icon
      data: widget.data,
      axis: Axis.vertical,
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: widget.child,
      ), // Hide the original icon while dragging
      onDraggableCanceled: (_, __) => setState(() => _isDropped = false),
      onDragCompleted: () => setState(() => _isDropped = true),
      child: _isDropped
          ? Container() // Placeholder for the dropped icon
          : widget.child,
    );
  }
}
