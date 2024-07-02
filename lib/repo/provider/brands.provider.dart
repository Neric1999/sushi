import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sushi/domain/models/brand.model.dart';

class BrandNotifier extends StateNotifier<List<Brand>> {
  BrandNotifier() : super([]);

  void setBrands(List<Brand> brands) {
    state = brands;
  }
}

final brandProvider = StateNotifierProvider<BrandNotifier, List<Brand>>((ref) {
  return BrandNotifier();
});
