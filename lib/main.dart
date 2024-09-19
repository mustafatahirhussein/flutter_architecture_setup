import 'package:flutter/material.dart';
import 'package:project_architecture/app.dart';
import 'package:project_architecture/injection_containers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const App());
}