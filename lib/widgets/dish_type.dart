import 'package:zartek/config/constants.dart';
import 'package:flutter/material.dart';

class DishType extends StatelessWidget {
  const DishType({
    required this.dishType,
    super.key,
  });

  final int dishType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: dishType == dishTypeVeg ? Colors.green : Colors.red,
        ),
      ),
      child: Container(
        height: 12,
        width: 12,
        decoration: BoxDecoration(
          color: dishType == dishTypeVeg ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
