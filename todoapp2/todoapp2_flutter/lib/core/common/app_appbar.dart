import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/core/common/text_component.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final Widget body;
  const CustomAppbar({
    required this.title,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // AppBar
        Container(
          height: kToolbarHeight + 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: TextComponent(
              title,
              fontsize: 24,
              fontweight: FontWeight.w600,
            ),
          ),
        ),
        // Bouton retour
        Positioned(
          top: kToolbarHeight / 2 + 65,
          left: 16,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 61, 61, 61),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 185, 185, 185)
                          .withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          )
          ),
        
        // Corps de la page
        Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight + 80),
          child: body,
        ),
      ],
    );
  }
}