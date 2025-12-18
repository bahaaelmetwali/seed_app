import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/core/utils/constants/colors.dart';
import 'package:seed_app/features/advertisements/domain/use_cases/get_ads_use_case.dart';
import 'package:seed_app/features/advertisements/domain/use_cases/get_cities_use_case.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/get_ads/get_ads_cubit.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/get_city/get_city_cubit.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/selected_city.dart/selected_city_cubit.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectedCityCubit>(create: (_) => SelectedCityCubit()),

        BlocProvider<GetCityCubit>(
          create: (context) => GetCityCubit(
            getIt<GetCitiesUseCase>(),
            selectedCityCubit: context.read<SelectedCityCubit>(),
          )..getCities(),
        ),

        BlocProvider<GetAdsCubit>(
          create: (context) => GetAdsCubit(
            getIt<GetAdsUseCase>(),
            context.read<SelectedCityCubit>(),
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.kscaffoldColor,
        body: SafeArea(child: HomeScreenBody()),
      ),
    );
  }
}
