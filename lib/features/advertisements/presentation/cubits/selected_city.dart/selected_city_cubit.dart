import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selected_city_state.dart';

class SelectedCityCubit extends Cubit<SelectedCityState> {
  SelectedCityCubit() : super(SelectedCityInitial());

  void selectCity(int cityId) {
    emit(SelectedCitySelected(cityId));
  }
}
