import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed_app/seed_app.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/core/utils/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  Bloc.observer = MyBlocObserver();

  runApp(const SeedApp());
}
