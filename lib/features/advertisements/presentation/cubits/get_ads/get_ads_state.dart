part of 'get_ads_cubit.dart';

sealed class GetAdsState extends Equatable {
  const GetAdsState();

  @override
  List<Object> get props => [];
}

final class GetAdsInitial extends GetAdsState {}

final class GetAdsLoading extends GetAdsState {}

final class GetAnotherAdsLoading extends GetAdsState {}

final class GetAdsLoaded extends GetAdsState {
  final List<Advertisment> ads;
  final bool hasMore;
  const GetAdsLoaded({required this.ads, required this.hasMore});

  @override
  List<Object> get props => [ads];
}

final class GetAdsEndReached extends GetAdsState {
  final List<Advertisment> ads;
  const GetAdsEndReached({required this.ads, });

  @override
  List<Object> get props => [ads];
}final class GetAdsEmpty extends GetAdsState {
 
  const GetAdsEmpty();

}

final class GetAdsFailure extends GetAdsState {
  final String errorMessage;
  const GetAdsFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
