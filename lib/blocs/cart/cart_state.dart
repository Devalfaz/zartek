part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState(this.items, this.total);
  final Map<Dish, int> items;
  final double total;

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [
        items,
        total,
      ];

  //toJSON
  Map<String, dynamic> toJson() {
    final items = {};
    this.items.forEach((key, value) {
      items.addAll({
        key.dishId: {'dish': key.toJson(), 'quantity': value}
      });
    });
    return {
      'items': items,
      'total': total,
    };
  }

  //fromJSON
  static CartState? fromJson(Map<String, dynamic> json) {
    final Map<Dish, int> items;
    final double total;
    try {
      items = {};
      json['items'].forEach((key, value) {
        items.addAll({
          Dish.fromJson(value['dish'] as Map<String, dynamic>):
              value['quantity'] as int
        });
      });
      total = json['total'] as double;
      return CartLoaded(items, total);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

class CartInitial extends CartState {
  const CartInitial() : super(const {}, 0);
}

class CartLoaded extends CartState {
  const CartLoaded(super.items, super.total);
}
