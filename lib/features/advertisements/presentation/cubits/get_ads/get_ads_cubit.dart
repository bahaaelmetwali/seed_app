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
        fetchAds(state.cityId);
      }
    });
  }

  Future<void> fetchAds(int cityId) async {
    emit(GetAdsLoading());
    final result = await _getAdsUseCase(page: 0, limit: 500, cityId: cityId);

    result.fold(
      (failure) => emit(GetAdsFailure(failure.toString())),
      (ads) => emit(GetAdsLoaded(ads)),
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
