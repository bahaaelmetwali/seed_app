import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seed_app/features/auth/domain/entity/user.dart';
import 'package:seed_app/features/auth/domain/use_cases/get_profile_use_case.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  final GetProfileUseCase _getProfileUseCase;

  GetProfileCubit(this._getProfileUseCase) : super(GetProfileInitial());

  Future<void> getProfile() async {
    emit(GetProfileLoading());

    final result = await _getProfileUseCase();

    result.fold(
      (failure) {
        emit(GetProfileFailure(failure.toString()));
      },
      (user) {
        emit(GetProfileSuccess(user));
      },
    );
  }
}
