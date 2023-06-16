import 'package:zartek/models/restaurant.dart';
import 'package:zartek/repositories/api.dart';

class RestaurantRepository {
  RestaurantRepository({required API api}) : _api = api;
  final API _api;

  Future<List<Restaurant>> getRestaurants() async {
    try {
      final response = await _api.dio.get<List<dynamic>>(
          'https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad');
      return Restaurant.listFromJson(response.data!);
    } on Exception {
      rethrow;
    }
  }
}
