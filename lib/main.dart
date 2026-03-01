import 'package:flutter/material.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/qunova_app.dart';

void main() async {
  // Sets up the service locator for dependency injection.
  initServiceLocator();

  // Runs the root widget of the application.
  runApp(const QunovaApp());
}
