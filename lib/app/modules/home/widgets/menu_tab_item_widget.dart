import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main/controller/main_controller.dart';

class MenuTabItemWidget extends GetView<MainController> {
  const MenuTabItemWidget({
    super.key,
    required this.onPressed,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
  });
  final VoidCallback onPressed;
  final String title;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 120,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(width: 0.1),
        borderRadius: BorderRadius.circular(32),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            elevation: 0,
            backgroundColor: Colors.transparent),
        onPressed: onPressed,
        child: Text(
          title,
          maxLines: 1,
          style: TextStyle(
              fontSize: 14, color: textColor, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
