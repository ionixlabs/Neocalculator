import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocalculator/screens/settings_screen/settings_controller.dart';
import 'package:neocalculator/utils/enum.dart';
import 'package:neocalculator/widgets/number_pad.dart';
import 'package:neocalculator/widgets/scientific_pad.dart';
import 'package:neocalculator/widgets/neumorphic_button.dart';

import 'calculator_controller.dart';

class CalculatorScreen extends GetView<CalculatorController> {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SettingsController>(builder: (settingsCtrl) {
          final borderRadius = settingsCtrl.state?.buttonRadius ?? 0.0;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GetBuilder<CalculatorController>(builder: (calcCtrl) {
                      return NeumorphicButton(
                        width: 100,
                        height: 40,
                        borderRadius: borderRadius,
                        onPressed: calcCtrl.toggleScientificMode,
                        child: Text(
                          calcCtrl.isScientificMode ? 'Basic' : 'Scientific',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Expanded(
                child: GetBuilder<CalculatorController>(builder: (calcCtrl) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: calcCtrl.isScientificMode
                        ? ScientificPad(
                            key: const ValueKey('scientific'),
                            borderRadius: borderRadius,
                            onScientificPressed: (button) {
                              calcCtrl.onScientificPressed(button.value);
                            },
                          )
                        : NumberPad(
                            key: const ValueKey('number'),
                            borderRadius: borderRadius,
                            onNumberPressed: (number) {
                              calcCtrl.onNumberPressed(number);
                            },
                            onOperationPressed: (button) {
                              switch (button) {
                                case CalculatorButton.openParenthesis ||
                                      CalculatorButton.closeParenthesis:
                                  calcCtrl.onParenthesesPressed(button.value);
                                  break;
                                case CalculatorButton.clear:
                                  calcCtrl.onDeletePressed();
                                  break;
                                case CalculatorButton.allClear:
                                  calcCtrl.onClearAllPressed();
                                  break;
                                case CalculatorButton.equal:
                                  calcCtrl.onEqualPressed();
                                  break;
                                case CalculatorButton.decimal:
                                  calcCtrl.onDecimalPressed();
                                  break;
                                default:
                                  calcCtrl.onOperatorPressed(button.value);
                              }
                            },
                          ),
                  );
                }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
