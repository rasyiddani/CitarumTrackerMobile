import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app.dart';
import 'package:flutter_getx_template/core/core/bindings/global_bindings.dart';

void main() async {
  /// Initializer
  GlobalBindings().dependencies();

  /// Utilities
  errorBuilder();

  /// Run App
  runApp(const App());
}

void errorBuilder() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              details.exception.toString(),
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  };
}