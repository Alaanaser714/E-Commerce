import 'package:e_commerce/core/repos/prosucts_repo/products_repo.dart';
import 'package:e_commerce/core/repos/prosucts_repo/products_repo_impl.dart';
import 'package:e_commerce/core/services/database_services.dart';
import 'package:e_commerce/core/services/firebase_services.dart';
import 'package:e_commerce/core/services/firestore_services.dart';
import 'package:e_commerce/features/auth/data/repo/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseServices>(FirebaseServices());
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseServices: getIt<FirebaseServices>(),
    databaseServices: getIt<DatabaseServices>(),
  ));

  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      getIt<DatabaseServices>(),
    ),
  );
}
