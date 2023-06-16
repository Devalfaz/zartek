import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:zartek/models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial()) {
    on<AddToCart>((event, emit) {
      if (state is CartInitial) {
        emit(CartLoaded({event.item: 1}, event.item.dishPrice));
      } else if (state is CartLoaded) {
        final currentState = state as CartLoaded;
        final items = Map<Dish, int>.from(currentState.items);
        if (items.containsKey(event.item)) {
          items[event.item] = items[event.item]! + 1;
        } else {
          items[event.item] = 1;
        }
        emit(CartLoaded(items, currentState.total + event.item.dishPrice));
      }
    });
    on<RemoveFromCart>(
      (event, emit) {
        if (state is CartLoaded) {
          final currentState = state as CartLoaded;
          final items = Map<Dish, int>.from(currentState.items);
          if (items.containsKey(event.item)) {
            if (items[event.item] == 1) {
              items.remove(event.item);
            } else {
              items[event.item] = items[event.item]! - 1;
            }
          }
          emit(CartLoaded(items, currentState.total - event.item.dishPrice));
        }
      },
    );
    on<ClearCart>(
      (event, emit) {
        emit(const CartInitial());
      },
    );
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    return CartState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    return state.toJson();
  }
}
