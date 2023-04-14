import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class NormalButtonWidget extends StatelessWidget {
  const NormalButtonWidget({
    super.key,
    required this.child,
    required this.onPressed,
    this.color = MyColors.orange,
    this.minimumSize,
    this.maximumSize,
  });

  final Size? minimumSize;
  final Size? maximumSize;

  final Widget child;
  final Color? color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            minimumSize: minimumSize,
            maximumSize: maximumSize,
            backgroundColor: color),
        onPressed: onPressed,
        child: child);
  }
}
