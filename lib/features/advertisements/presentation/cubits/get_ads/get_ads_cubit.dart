import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seed_app/features/advertisements/domain/entities/advertisment.dart';
import 'package:seed_app/features/advertisements/domain/use_cases/get_ads_use_case.dart';

part 'get_ads_state.dart';

class GetAdsCubit extends Cubit<GetAdsState> {
  final GetAdsUseCase _getAdsUseCase;
  GetAdsCubit(this._getAdsUseCase) : super(GetAdsInitial());
  final int limit = 5;
  final int page = 0;
  final cityId = 31;

  Future<void> fetchAds() async {
    emit(GetAdsLoading());
    final result = await _getAdsUseCase(
      page: page,
      limit: limit,
      cityId: cityId,
    );
    result.fold(
      (failure) => emit(GetAdsFailure(failure.toString())),
      (ads) => emit(GetAdsLoaded(ads)),
    );
  }
}
