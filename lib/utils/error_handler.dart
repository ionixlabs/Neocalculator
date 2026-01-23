import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// GlobalErrorHandler handles uncaught exceptions and Flutter errors.
class GlobalErrorHandler {
  /// Handles Flutter errors (e.g., layout errors).
  static void handleFlutterError(FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // You can log the error to a service like Sentry or Firebase Crashlytics here
    debugPrint('Flutter Error: ${details.exception}');
    debugPrint('Stack Trace: ${details.stack}');
  }

  /// Handles uncaught asynchronous errors.
  static void handleAsyncError(Object error, StackTrace stack) {
    // You can log the error to a service here
    debugPrint('Async Error: $error');
    debugPrint('Stack Trace: $stack');
    
    // safe to show a simpler notification for async errors if critical
    // Get.snackbar(
    //   'Error',
    //   'An unexpected error occurred.',
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Colors.redAccent.withOpacity(0.8),
    //   colorText: Colors.white,
    // );
  }

  /// returns a widget to display when a build error occurs
  static Widget buildErrorWidget(FlutterErrorDetails details) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 60),
              const SizedBox(height: 20),
              const Text(
                'Something went wrong!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'We encountered an error. Please try again later.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),
              if (Get.context != null)
                 ElevatedButton(
                  onPressed: () {
                    // Navigate back or to a safe state
                     Get.offAllNamed('/'); 
                  },
                  child: const Text('Go Home'),
                )
            ],
          ),
        ),
      ),
    );
  }
}
