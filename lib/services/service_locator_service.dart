import 'package:get_it/get_it.dart';
import 'package:iiitdmjcompanion/services/storage_service.dart';

final GetIt locator = GetIt.instance;

Future setupLocator() async {
  var instance = await StorageService.getInstance();
  locator.registerSingleton<StorageService>(instance);
}
