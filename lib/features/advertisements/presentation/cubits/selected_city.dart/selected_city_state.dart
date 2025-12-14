part of 'selected_city_cubit.dart';

class SelectedCityState extends Equatable {
  const SelectedCityState();

  @override
  List<Object?> get props => [];
}

final class SelectedCityInitial extends SelectedCityState {}

final class SelectedCitySelected extends SelectedCityState {
  final int cityId;

  const SelectedCitySelected(this.cityId);

  @override
  List<Object?> get props => [cityId];
}
