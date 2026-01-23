import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neocalculator/controllers/preference_controller.dart';
import 'package:neocalculator/controllers/theme_controller.dart';
import 'package:neocalculator/repo/database.dart';
import 'package:neocalculator/screens/dashboard_screen/dashboard_screen.dart';
import 'package:neocalculator/screens/splash_screen/splash_screen.dart';
import 'package:neocalculator/utils/bindings.dart';
import 'package:neocalculator/utils/const.dart';
import 'package:neocalculator/utils/error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_theme/system_theme.dart';
import 'utils/enum.dart';

Future<void> main() async {
  // Setup Global Error Handling
  FlutterError.onError = (FlutterErrorDetails details) {
    GlobalErrorHandler.handleFlutterError(details);
  };
  
  PlatformDispatcher.instance.onError = (error, stack) {
    GlobalErrorHandler.handleAsyncError(error, stack);
    return true;
  };

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await SystemTheme.accentColor.load();
  await Get.putAsync<SharedPreferences>(
          () async => await SharedPreferences.getInstance());
  Get.put(DatabaseRepository(Get.find<SharedPreferences>()));
  Get.put(PreferencesController(Get.find<DatabaseRepository>()));

  // Customize the error widget for release mode if needed
  if (!kDebugMode) {
      ErrorWidget.builder = (FlutterErrorDetails details) {
        return GlobalErrorHandler.buildErrorWidget(details);
      };
  }

  runApp(const NeumorphicCalculatorApp());
}

class NeumorphicCalculatorApp extends StatelessWidget {
  const NeumorphicCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(
          Get.find<DatabaseRepository>(), Get.find<PreferencesController>()),
      builder: (ctrl) {
        return GetMaterialApp(
          initialBinding: InitBindings(),
          debugShowCheckedModeBanner: false,
          title: AppConst.appName,
          themeMode: ctrl.themeMode,
          theme: ctrl.lightTheme,
          darkTheme: ctrl.darkTheme,
          home: const SplashScreen(), // Set SplashScreen as the initial route
        );
      },
    );
  }
}
