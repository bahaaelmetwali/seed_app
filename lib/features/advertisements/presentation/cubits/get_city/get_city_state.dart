part of 'get_city_cubit.dart';

sealed class GetCityState extends Equatable {
  const GetCityState();

  @override
  List<Object> get props => [];
}

final class GetCityInitial extends GetCityState {}

final class GetCityLoading extends GetCityState {
}

final class GetCitySucess extends GetCityState {
  final List<City> cities ; 
  
  const GetCitySucess(this.cities) ;
  @override
  List<Object> get props => [cities];
}

final class GetCityFailure extends GetCityState {
  final String errorMessage ;
  const GetCityFailure(this.errorMessage) ;
  @override
  List<Object> get props => [errorMessage];

}
