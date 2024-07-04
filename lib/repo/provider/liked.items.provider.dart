import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/domain/models/brand.model.dart';

class LikedItemsNotifier extends StateNotifier<List<Item>> {
  LikedItemsNotifier() : super([]);

  void toggleItem(Item item) {
    if (state.any((i) => i.id == item.id)) {
      // If item is in the list, remove it
      state = state.where((i) => i.id != item.id).toList();
    } else {
      // If item is not in the list, add it
      state = [...state, item];
    }
  }
}

final likedItemsProvider =
    StateNotifierProvider<LikedItemsNotifier, List<Item>>((ref) {
  return LikedItemsNotifier();
});
