part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  const AddToCart(this.item);
  final Dish item;

  @override
  List<Object> get props => [item];
}

class RemoveFromCart extends CartEvent {
  const RemoveFromCart(this.item);
  final Dish item;

  @override
  List<Object> get props => [item];
}

class ClearCart extends CartEvent {}
