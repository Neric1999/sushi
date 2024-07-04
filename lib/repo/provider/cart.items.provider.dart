import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/domain/models/brand.model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, Map<Item, int>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<Map<Item, int>> {
  CartNotifier() : super({});

  void addItem(Item item) {
    if (state.containsKey(item)) {
      state = {
        ...state,
        item: state[item]! + 1,
      };
    } else {
      state = {
        ...state,
        item: 1,
      };
    }
  }

  void removeItem(Item item) {
    if (state.containsKey(item)) {
      final currentQuantity = state[item]!;
      if (currentQuantity > 1) {
        state = {
          ...state,
          item: currentQuantity - 1,
        };
      } else {
        final newState = Map<Item, int>.from(state);
        newState.remove(item);
        state = newState;
      }
    }
  }
}
