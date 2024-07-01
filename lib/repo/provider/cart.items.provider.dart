import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/domain/models/meal.model.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, List<MealModel>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<MealModel>> {
  CartNotifier() : super([]);

  void addItem(MealModel item) {
    state = [...state, item];
  }

  int get itemCount => state.length;
}
