import 'package:flutter/material.dart';

class ButtonItemsWidget extends StatelessWidget {
  const ButtonItemsWidget({
    super.key,
    required this.onTap,
    required this.icon,
  });
  final void Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
