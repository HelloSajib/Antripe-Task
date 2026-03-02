import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/core/constants/local_database_keys.dart';
import 'package:flutter_task/qunova_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Keeps the native splash screen visible until the app is fully initialized.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  // Sets up the service locator for dependency injection.
  initServiceLocator();

  // Initializes Hive for local data storage.
  await Hive.initFlutter();
  // Create Local database.
  await Hive.openBox(LocalDatabaseKeys.database);

  // Runs the root widget of the application.
  runApp(const QunovaApp());
}
