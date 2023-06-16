import 'package:beegains/blocs/blocs.dart';
import 'package:beegains/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBar extends StatelessWidget {
  const CounterBar({
    required this.onTapPlus,
    required this.onTapMinus,
    required this.currentDish,
    super.key,
  });

  final void Function()? onTapPlus;
  final void Function()? onTapMinus;
  final Dish currentDish;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.green[400],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              onTapMinus?.call();
            },
            child: const Icon(
              Icons.remove,
              color: Colors.white,
              size: 16,
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Text(
                '${state.items[currentDish] ?? 0}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              );
            },
          ),
          InkWell(
            onTap: () {
              onTapPlus?.call();
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
