import 'package:get_it/get_it.dart';
import 'package:speechth/src/domain/repositries/user_repo.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static init() {
    sl.registerLazySingleton<UserRepo>(() => UserRepo());
  }
}
