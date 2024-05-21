import 'package:flutter_4a/repository/item_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt lc = GetIt.instance;

Future<void> initializeDependencies() async {
  lc.registerSingleton<ItemRepository>(ItemRepository());
  // add more dependencies
}
