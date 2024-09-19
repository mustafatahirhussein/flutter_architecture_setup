import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:project_architecture/core/utils/app_snackbar.dart';

class NetworkStatusProvider extends ChangeNotifier {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  bool _isConnected = false;

  ConnectivityResult get connectivityResult => _connectivityResult;
  bool get isConnected => _isConnected;

  void updateConnectivity(ConnectivityResult result) {
    _connectivityResult = result;
    _isConnected = result != ConnectivityResult.none;

    if(!_isConnected) {
      AppSnackbar.logMessage("Internet connection lost");
    }
    notifyListeners();
  }
}