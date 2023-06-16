import 'package:beegains/blocs/blocs.dart';
import 'package:beegains/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            //border with material elevation
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      color: Colors.green.shade900,
                      child: Text(
                        '${state.items.length} Dishes - ${state.items.isNotEmpty ? state.items.values.reduce((value, element) => value + element) : 0} items',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ...[
                      for (final item in state.items.entries)
                        ListTile(
                          title: Row(
                            children: [
                              DishType(
                                dishType: item.key.dishType,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      item.key.dishName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    //Total Price times the number of items
                                    Text(
                                      '${item.key.dishCurrency} ${item.key.dishPrice * item.value}',
                                    ),
                                    // Total Calories times the number of items
                                    Text(
                                      '${item.key.dishCalories * item.value} calories',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CounterBar(
                                onTapPlus: () {
                                  BlocProvider.of<CartBloc>(
                                    context,
                                  ).add(
                                    AddToCart(item.key),
                                  );
                                },
                                onTapMinus: () {
                                  BlocProvider.of<CartBloc>(
                                    context,
                                  ).add(
                                    RemoveFromCart(item.key),
                                  );
                                },
                                currentDish: item.key,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${item.key.dishCurrency} ${item.key.dishPrice}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      const Divider(
                        thickness: 2,
                        indent: 10,
                        endIndent: 10,
                      ),
                      ListTile(
                        title: const Text(
                          'Total Amount',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          '${state.items.keys.firstOrNull?.dishCurrency ?? 0} ${state.total}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]
                  ],
                );
              },
            ),
          ),
          const Spacer(),
          // long button with circle border
          Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextButton(
              onPressed: () {
                // Show a dialog with 'Order Succesfully Placed'
                // and navigate to home screen , clear the cart
                showDialog<void>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Order Placed'),
                      content: const Text('Order Succesfully Placed'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop();
                            BlocProvider.of<CartBloc>(context).add(
                              ClearCart(),
                            );
                            context.pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Place Order',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
