import 'package:beegains/models/restaurant.dart';
import 'package:beegains/repositories/restaurant_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantsState> {
  RestaurantCubit(this.repository) : super(RestaurantsInitial()) {
    _onInitial();
  }
  final RestaurantRepository repository;
  Future<void> _onInitial() async {
    try {
      final restaurants = await repository.getRestaurants();
      emit(RestaurantsInitialLoaded(restaurants));
    } catch (e) {
      emit(RestaurantsInitialError(e.toString()));
    }
  }
}
