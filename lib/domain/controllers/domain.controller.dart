import 'package:sushi/domain/models/brand.model.dart';
import 'package:sushi/locator.dart';
import 'package:sushi/repo/repository.dart';

class DomainController {
  Future<List<Brand>?> getBrands() async {
    final brands = await locator.get<Repository>().getBrands();
    return brands;
  }
}
