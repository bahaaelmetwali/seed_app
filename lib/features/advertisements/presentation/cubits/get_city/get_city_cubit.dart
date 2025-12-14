import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seed_app/features/advertisements/domain/entities/city.dart';
import 'package:seed_app/features/advertisements/domain/use_cases/get_cities_use_case.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/selected_city.dart/selected_city_cubit.dart';

part 'get_city_state.dart';

class GetCityCubit extends Cubit<GetCityState> {
  GetCityCubit(this.getCitiesUseCase, {required this.selectedCityCubit})
    : super(GetCityInitial());
  final GetCitiesUseCase getCitiesUseCase;
  final SelectedCityCubit selectedCityCubit;

  Future<void> getCities() async {
    emit(GetCityLoading());
    final result = await getCitiesUseCase();
    result.fold((failure) => emit(GetCityFailure(failure.toString())), (
      cities,
    ) {
      emit(GetCitySucess(cities));
      selectedCityCubit.selectCity(cities.first.id);
    });
  }
}
