import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:project_architecture/config/helpers/network_status.dart';
import 'package:project_architecture/config/routes/navigation_service.dart';
import 'package:provider/provider.dart';

import '../../injection_containers.dart';
//
class MyConnectivity {
  MyConnectivity._();

  static final _instance = MyConnectivity._();
  static MyConnectivity get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;

  initialise() async {
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    _checkStatus(result.first);
    _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result.first);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    sl<NetworkStatusProvider>().updateConnectivity(result);
  }

  void disposeStream() => _controller.close();
}

// class MyConnectivity {
//   MyConnectivity._();
//
//   static final _instance = MyConnectivity._();
//   static MyConnectivity get instance => _instance;
//   final _connectivity = Connectivity();
//   final _controller = StreamController.broadcast();
//   Stream get myStream => _controller.stream;
//
//   void initialise() async {
//     List<ConnectivityResult> result = await _connectivity.checkConnectivity();
//     _checkStatus(result.first);
//     _connectivity.onConnectivityChanged.listen((result) {
//       _checkStatus(result.first);
//     });
//   }
//
//   void _checkStatus(ConnectivityResult result) async {
//     bool isOnline = false;
//     try {
//       final result = await InternetAddress.lookup('example.com');
//       isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//     } on SocketException catch (_) {
//       isOnline = false;
//     }
//     // Update NetworkStatusProvider with new information
//     Provider.of<NetworkStatusProvider>(NavigationService().getContext(), listen: false).updateConnectivity(result);
//   }
//
//   void disposeStream() => _controller.close();
// }