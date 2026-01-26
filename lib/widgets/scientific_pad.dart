// scientific_pad.dart
// Defines the scientific function pad for the calculator, offering trigonometric, logarithmic, and other advanced functions.

import 'package:flutter/material.dart';
import '../utils/enum.dart';
import 'neumorphic_button.dart';

/// ScientificPad provides a grid of scientific functions for advanced calculations.
class ScientificPad extends StatelessWidget {
  const ScientificPad({
    super.key,
    this.onScientificPressed,
    required this.borderRadius,
  });

  final void Function(CalculatorButton button)? onScientificPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    const fontSize = 16.0;

    final scientificStyle = TextStyle(
      color: primaryColor,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );

    Widget buildTextBtn(CalculatorButton button) {
      return NeumorphicButton(
        borderRadius: borderRadius,
        onPressed: () => onScientificPressed?.call(button),
        child: Text(button.value, style: scientificStyle),
      );
    }

    return RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTextBtn(CalculatorButton.sin),
              buildTextBtn(CalculatorButton.cos),
              buildTextBtn(CalculatorButton.tan),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTextBtn(CalculatorButton.log),
              buildTextBtn(CalculatorButton.ln),
              buildTextBtn(CalculatorButton.sqrt),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTextBtn(CalculatorButton.power),
              buildTextBtn(CalculatorButton.pi),
              buildTextBtn(CalculatorButton.e),
            ],
          ),
        ],
      ),
    );
  }
}
