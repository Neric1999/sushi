import 'package:get_it/get_it.dart';
import 'package:sushi/domain/controllers/domain.controller.dart';
import 'package:sushi/repo/repository.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerSingleton<DomainController>(DomainController());
  locator.registerSingleton<Repository>(Repository());
}
