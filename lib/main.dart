import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed_app/features/auth/data/data_source/local_data_source.dart';
import 'package:seed_app/seed_app.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/core/utils/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  getIt<LocalDataSource>().clearToken() ;

  runApp(const SeedApp());
}
