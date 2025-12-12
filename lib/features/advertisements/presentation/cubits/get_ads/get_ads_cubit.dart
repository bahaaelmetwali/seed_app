import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seed_app/features/advertisements/domain/entities/advertisment.dart';
import 'package:seed_app/features/advertisements/domain/use_cases/get_ads_use_case.dart';

part 'get_ads_state.dart';

class GetAdsCubit extends Cubit<GetAdsState> {
  final GetAdsUseCase _getAdsUseCase ;
  GetAdsCubit(this._getAdsUseCase) : super(GetAdsInitial());
Future<void> fetchAds()async {
  emit(GetAdsLoading()) ;
  final result = await _getAdsUseCase() ;
result.fold((failure)=>emit(GetAdsFailure(failure.toString())), (ads)=>emit(ads)) ;

}
}
