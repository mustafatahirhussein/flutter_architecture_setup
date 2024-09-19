import 'package:flutter/material.dart';
import 'package:project_architecture/config/routes/navigation_service.dart';

import '../../injection_containers.dart';

class AppSnackbar {

  static void logMessage(String message) {
    ScaffoldMessenger.of(sl<NavigationService>().getContext()).showSnackBar(SnackBar(content: Text(message)));
  }
}