part of 'get_ads_cubit.dart';

sealed class GetAdsState extends Equatable {
  const GetAdsState();

  @override
  List<Object> get props => [];
}

final class GetAdsInitial extends GetAdsState {}
final class GetAdsLoading extends GetAdsState {}
final class GetAdsLoaded extends GetAdsState {
 final List<Advertisment?> ads; 
  const GetAdsLoaded(this.ads);
  
  @override
  List<Object> get props => [ads];
}
final class GetAdsFailure extends GetAdsState {
 final String errorMessage; 
  const GetAdsFailure(this.errorMessage);
  
  @override
  List<Object> get props => [errorMessage];
}

