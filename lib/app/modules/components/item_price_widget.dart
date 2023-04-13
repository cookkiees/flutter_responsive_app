import 'package:flutter/material.dart';

class ItemsPriceWidget extends StatelessWidget {
  const ItemsPriceWidget({
    super.key,
    required this.title,
    required this.price,
  });

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade500,
              overflow: TextOverflow.ellipsis),
        ),
        Text(
          price,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }
}
