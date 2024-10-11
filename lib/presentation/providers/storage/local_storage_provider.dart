import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testcinema/infrastructure/datasources/isar_datasource.dart';
import 'package:testcinema/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
