import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_architecture/app.dart';
import 'package:project_architecture/base_widget.dart';
import 'package:project_architecture/config/helpers/network_status.dart';
import 'package:project_architecture/injection_containers.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(ChangeNotifierProvider<NetworkStatusProvider>(
    create: (context) => NetworkStatusProvider(),
    child: const BaseWidget(child: App()),
  ));
}
