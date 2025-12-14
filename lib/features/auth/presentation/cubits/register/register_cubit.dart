import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seed_app/features/auth/domain/entity/register_request.dart';
import 'package:seed_app/features/auth/domain/use_cases/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase) : super(RegisterInitial());
  final RegisterUseCase _registerUseCase;

  Future<void> register(RegisterRequest request) async {
    emit(RegistrLoading());

    final result = await _registerUseCase(request);

    result.fold(
      (failure) => emit(RegisterFailure(failure.toString())),
      (unit) => emit(RegisterSucess()),
    );
  }
}
