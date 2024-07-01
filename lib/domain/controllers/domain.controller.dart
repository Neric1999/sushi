import 'package:sushi/domain/models/brand.model.dart';
import 'package:sushi/locator.dart';
import 'package:sushi/repo/repository.dart';

class DomainController {
  Future<Brand?> getBrands() async {
    final brand = await locator.get<Repository>().getBrands();
    return brand;
  }
}
