import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva_sport/controllers/match_controller.dart';

class CategoriesButton extends GetView<MatchController> {
  const CategoriesButton(
      {super.key, required this.img, required this.text, required this.index});
  final int index;
  final String img;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchController>(
        init: MatchController(),
        builder: (controller) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            margin: const EdgeInsets.only(top: 30.0, left: 20.0),
            padding: controller.currnt == index
                ? const EdgeInsets.only(left: 5.0, right: 10.0)
                : const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: controller.currnt == index
                  ? Colors.blueAccent
                  : const Color.fromARGB(255, 250, 250, 250),
            ),
            child: controller.currnt == index
                ? Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          img,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Text(text),
                    ],
                  )
                : Container(
                    height: 40,
                    width: 40,
                    clipBehavior: Clip.none,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        img,
                        width: 50,
                      ),
                    ),
                  ),
          );
        });
  }
}
