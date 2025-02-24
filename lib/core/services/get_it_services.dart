import 'package:e_commerce/core/services/firebase_services.dart';
import 'package:e_commerce/features/auth/data/repo/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseServices>(FirebaseServices());
  getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(firebaseServices: getIt<FirebaseServices>()));
}
