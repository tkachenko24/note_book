import 'package:get_it/get_it.dart';
import 'injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CommonInjectable extends Injectable {
  @override
  Future<void> register(
    GetIt it,
  ) async {
    it.registerSingletonAsync<LazyBox<dynamic>>(() async {
      await Hive.initFlutter();
      return await Hive.openLazyBox(
        'notes',
      );
    });
    await it.allReady();
  }
}
