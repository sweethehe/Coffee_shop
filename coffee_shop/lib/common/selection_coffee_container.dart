import 'package:coffee_shop/ui/colors.dart';
import 'package:flutter/material.dart';

class SelectionCoffeeContainer extends StatelessWidget {
  final String title;
  final bool isTapped;
  final VoidCallback onTap;

  const SelectionCoffeeContainer({
    super.key,
    required this.title,
    required this.isTapped,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: isTapped
              ? primaryColor
              : backgroundColor.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isTapped ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
