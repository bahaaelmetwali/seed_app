import 'package:seed_app/features/auth/domain/entity/send_request.dart';
import 'package:seed_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:seed_app/features/auth/presentation/cubits/cubit/login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitial());

  Future<void> login(SendRequest request) async {
    emit(LoginLoading());

    final result = await _loginUseCase(request);

    result.fold(
      (failure) => emit(LoginFailure(failure.toString())),
      (unit) => emit(LoginSuccess()),
    );
  }
}