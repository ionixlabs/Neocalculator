// custom_scroll_physics.dart
// Custom scroll physics for fine-tuned scrolling behavior in the app.

import 'package:flutter/material.dart';

/// CustomScrollPhysics provides custom scroll behavior for scrollable widgets.
class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({super.parent});

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double get dragStartDistanceMotionThreshold => 18.0;
}
