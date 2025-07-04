import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/core/lol_controller.dart';

class LolPage extends GetView<LolController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lol Page'),
      ),
      body:  Center(
        child: Text(controller.txt.value),
      ),
    );
  }
}

class MdrPage extends GetView<MdrController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mdr Page'),
      ),
      body:  Center(
        child: Text(controller.txt.value),
      ),
    );
  }
}