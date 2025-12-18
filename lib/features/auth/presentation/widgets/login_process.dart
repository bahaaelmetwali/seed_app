import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seed_app/core/router/app_router_names.dart';
import 'package:seed_app/core/ui/custom_buttons.dart';
import 'package:seed_app/core/ui/custom_loading_indicator.dart';
import 'package:seed_app/core/ui/show_custom_snack_bar.dart';
import 'package:seed_app/features/auth/domain/entity/send_request.dart';
import 'package:seed_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:seed_app/features/auth/presentation/cubits/login/login_state.dart';

class LoginProcess extends StatelessWidget {
  const LoginProcess({
    super.key,
    required this.mobileEditingController,
    required this.formKey,
  });
  final TextEditingController mobileEditingController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showCustomSnackBar(context, message: 'تم تسجيل الدخول بنجاح');
          context.go(
            AppRouterNames.otpScreen,
            extra: mobileEditingController.text,
          );
        } else if (state is LoginFailure) {
          showCustomSnackBar(context, message: state.message, isError: true);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return CustomLoadingIndicator();
        } else {
          return CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String mobile = mobileEditingController.text;
                final SendRequest sendRequest = SendRequest(mobile: mobile);

                context.read<LoginCubit>().login(sendRequest);
              }
            },
            text: 'تسجيل الدخول',
          );
        }
      },
    );
  }
}
