import 'package:get/get.dart';
import 'home_controller.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/core/common/app_colors.dart';

class Homepage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
        route: '/home',
        builder: (context) {
          return Scaffold(
            body: GetRouterOutlet(
              initialRoute: '/home/tasks',
              anchorRoute: '/home',
            ),
           bottomNavigationBar: IndexedRouteBuilder(
            routes: controller.items.map((e) => e.route).toList(),
            builder: (context, routes, index) {
               print('routes: $routes');
              print('routes: $index');
              final delegate = context.delegate;
              return  BottomNavigationBar(
                  currentIndex: index,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  selectedItemColor: kcBlueColor,
                  unselectedItemColor: Colors.black,
                  iconSize: 30,
                  
                  selectedFontSize: 14,
                  unselectedFontSize: 10,
                  onTap: (value) => delegate.toNamed(routes[value]),
                  items: controller.items.map((e) => e.item).toList(),
                );
            }
           ),
          );
        });
  }
}
