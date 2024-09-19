import 'dart:async';
import 'package:flutter/material.dart';

import 'config/helpers/connectivity.dart';
import 'config/helpers/network_status.dart';
import 'injection_containers.dart';

class BaseWidget extends StatefulWidget {
  final Widget child;

  const BaseWidget({Key? key, required this.child}) : super(key: key);

  @override
  BaseWidgetState createState() => BaseWidgetState();
}

class BaseWidgetState extends State<BaseWidget> {
  late StreamSubscription _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    MyConnectivity.instance.initialise();
    _connectivitySubscription = MyConnectivity.instance.myStream.listen((source) {
      sl<NetworkStatusProvider>().updateConnectivity(source.keys.toList()[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}