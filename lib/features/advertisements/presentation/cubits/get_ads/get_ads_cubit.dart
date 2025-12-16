import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seed_app/features/advertisements/domain/entities/advertisment.dart';
import 'package:seed_app/features/advertisements/domain/use_cases/get_ads_use_case.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/selected_city.dart/selected_city_cubit.dart';

part 'get_ads_state.dart';

class GetAdsCubit extends Cubit<GetAdsState> {
  final GetAdsUseCase _getAdsUseCase;
  final SelectedCityCubit selectedCityCubit;
  late final StreamSubscription _subscription;

  GetAdsCubit(this._getAdsUseCase, this.selectedCityCubit)
      : super(GetAdsInitial()) {
    _subscription = selectedCityCubit.stream.listen((state) {
      if (state is SelectedCitySelected) {
        refreshAds(cityId: state.cityId);
      }
    });
  }

  int limit = 2;
  int page = 1;
  int? currentCityId;
  bool hasMore = true;
  bool isFetching = false;

  final List<Advertisment> advertisements = [];

  Future<void> fetchMoreAds() async {
    if (!hasMore || isFetching) return;

    page++;
    await fetchAdvertisments();
  }

  Future<void> refreshAds({required int cityId}) async {
    page = 1;
    hasMore = true;
    isFetching = false;
    currentCityId = cityId;
    advertisements.clear();
    emit(GetAdsLoading());
    await fetchAdvertisments();
  }

  Future<void> fetchAdvertisments() async {
    isFetching = true;
    final response = await _getAdsUseCase(
      cityId: currentCityId!,
      limit: limit,
      page: page,
    );

    response.fold(
      (failure) {
        isFetching = false;
        emit(GetAdsFailure(failure.toString()));
      },
      (ads) {
        isFetching = false;

        advertisements.addAll(ads);
        hasMore = ads.length == limit;

        emit(GetAdsLoaded(
          ads: List.from(advertisements),
          hasMore: hasMore,
        ));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
