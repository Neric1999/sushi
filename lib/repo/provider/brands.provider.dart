import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/domain/models/brand.model.dart';

class BrandsNotifier extends StateNotifier<List<Brand>> {
  BrandsNotifier() : super([]);

  void setBrands(List<Brand> brands) {
    state = brands;
  }
}

final brandProvider = StateNotifierProvider<BrandsNotifier, List<Brand>>((ref) {
  return BrandsNotifier();
});

class SearchNotifier extends StateNotifier<String> {
  SearchNotifier() : super('');

  void setSearchTerm(String term) {
    state = term;
  }
}

final searchProvider = StateNotifierProvider<SearchNotifier, String>((ref) {
  return SearchNotifier();
});
