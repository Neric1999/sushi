// liked_items_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/domain/models/brand.model.dart';

class LikedItemsNotifier extends StateNotifier<Set<Item>> {
  LikedItemsNotifier() : super({});

  void addItem(Item item) {
    state = {...state, item};
  }

  void removeItem(Item item) {
    state = state.where((i) => i.id != item.id).toSet();
  }
}

final likedItemsProvider =
    StateNotifierProvider<LikedItemsNotifier, Set<Item>>((ref) {
  return LikedItemsNotifier();
});
