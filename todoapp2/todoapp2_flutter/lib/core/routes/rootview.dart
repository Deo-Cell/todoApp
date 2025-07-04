import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RootView extends GetView {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetRouterOutlet(
        initialRoute: '/splash',
        anchorRoute: '/', 
      ),
    );
  }
}
