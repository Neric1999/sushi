import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/domain/models/brand.model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Item>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<Item>> {
  CartNotifier() : super([]);

  void addItem(Item item) {
    state = [...state, item];
  }

  int get itemCount => state.length;
}
