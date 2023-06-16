part of 'restaurant_cubit.dart';

abstract class RestaurantsState extends Equatable {
  const RestaurantsState();

  @override
  List<Object> get props => [];
}

class RestaurantsInitial extends RestaurantsState {}

class RestaurantsInitialLoaded extends RestaurantsState {
  const RestaurantsInitialLoaded(this.products);
  final List<Restaurant> products;

  @override
  List<Object> get props => [products];
}

class RestaurantsInitialError extends RestaurantsState {
  const RestaurantsInitialError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
