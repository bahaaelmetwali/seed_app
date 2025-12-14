import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/features/advertisements/domain/use_cases/get_ads_use_case.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/get_ads/get_ads_cubit.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/get_city/get_city_cubit.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<GetCityCubit>()..getCities()),
        BlocProvider(create: (context) => GetAdsCubit(getIt<GetAdsUseCase>())),
      ],
      child: Scaffold(
        backgroundColor: Constants.kscaffoldColor,
        body: SafeArea(child: HomeScreenBody()),
      ),
    );
  }
}
