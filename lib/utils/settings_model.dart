// settings_model.dart
// Defines the SettingsModel class for storing user preferences and app settings.

import 'package:equatable/equatable.dart';
import 'enum.dart';

/// SettingsModel holds user preferences such as haptic feedback, theme, font, and more.
class SettingsModel extends Equatable {
  final bool hapticEnabled;
  final double buttonRadius;
  final Fonts font;
  final bool showHistoryTip;
  final bool scientific;
  final bool dynamicColor;
  final ThemeColor themeColor;
  const SettingsModel({
    required this.hapticEnabled,
    required this.dynamicColor,
    required this.buttonRadius,
    required this.font,
    required this.showHistoryTip,
    required this.scientific,
    required this.themeColor,
  });

  factory SettingsModel.normal() {
    return const SettingsModel(
      hapticEnabled: true,
      dynamicColor: false,
      buttonRadius: 12.0,
      showHistoryTip: true,
      scientific: false,
      themeColor: ThemeColor.tealBlue,
      font: Fonts.cabin,
    );
  }

  SettingsModel copyWith(
      {bool? hapticEnabled,
      double? buttonRadius,
      bool? showHistoryTip,
      bool? scientific,
      bool? dynamicColor,
      ThemeColor? themeColor,
      Fonts? font}) {
    return SettingsModel(
        hapticEnabled: hapticEnabled ?? this.hapticEnabled,
        buttonRadius: buttonRadius ?? this.buttonRadius,
        scientific: scientific ?? this.scientific,
        themeColor: themeColor ?? this.themeColor,
        dynamicColor: dynamicColor ?? this.dynamicColor,
        font: font ?? this.font,
        showHistoryTip: showHistoryTip ?? this.showHistoryTip);
  }

  Map<String, dynamic> toMap() {
    return {
      'hapticEnabled': hapticEnabled,
      'dynamicColor': dynamicColor,
      'buttonRadius': buttonRadius,
      'scientific': scientific,
      'themeColor': themeColor.index,
      'font': font.index,
      'showHistoryTip': showHistoryTip,
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      hapticEnabled: map['hapticEnabled'] ?? true,
      scientific: map['scientific'] ?? false,
      dynamicColor: map['dynamicColor'] ?? false,
      buttonRadius: map['buttonRadius'] ?? 12.0,
      font: Fonts.values[map['font'] ?? 0],
      showHistoryTip: map['showHistoryTip'] ?? true,
      themeColor: ThemeColor.values[map['themeColor'] ?? 0],
    );
  }

  @override
  List<Object?> get props => [
        hapticEnabled,
        buttonRadius,
        scientific,
        themeColor,
        dynamicColor,
        font,
      ];
}
