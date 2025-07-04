import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class HomeController extends GetxController {
 final counter = 0.obs;
 int lastPage = 0;

  final Rx<int> bottomNavigatorIndex = Rx(0);
  MBarItem get  currentItem => items[bottomNavigatorIndex.value];

  Transition get currentTransition {
    if(lastPage < bottomNavigatorIndex.value){
      lastPage = bottomNavigatorIndex.value;
      return Transition.leftToRight;
    }
    if(lastPage > bottomNavigatorIndex.value){
      lastPage = bottomNavigatorIndex.value;
      return Transition.rightToLeft;
    }
    return Transition.noTransition;
  }
  
  @override
  
  void onInit() {
    super.onInit();
    print("init home");
  }

 List<MBarItem> items = [
    MBarItem(
        route: '/home/tasks',
        item:  BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home')
    ),
    MBarItem(
        route: '/home/podomoro',
        item:  BottomNavigationBarItem(icon: Icon(CupertinoIcons.timer), label: 'Podomoro')
    ),
    MBarItem(
        route: '/home/settings',
        item:  BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings')
    ),
   
  ];

}

class MBarItem{
  final String route;
  final BottomNavigationBarItem item;
  MBarItem({required this.route, required this.item});
}
 