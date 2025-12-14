
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seed_app/core/router/app_router_names.dart';
import 'package:seed_app/core/widgets/custom_buttons.dart';
import 'package:seed_app/core/widgets/custom_loading_indicator.dart';
import 'package:seed_app/core/widgets/show_custom_snack_bar.dart';
import 'package:seed_app/features/auth/domain/entity/register_request.dart';
import 'package:seed_app/features/auth/presentation/cubits/register/register_cubit.dart';

class RegisterProcess extends StatelessWidget {
  const RegisterProcess({
    super.key,
    required this.mobileEditingController,
    required this.formKey,
    required this.nameEditingController,
    required this.emailEditingController,
  });
  final TextEditingController mobileEditingController;
  final TextEditingController nameEditingController;
  final TextEditingController emailEditingController;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSucess) {
          showCustomSnackBar(context, message: 'تم انشاء حساب  بنجاح');
          context.go(
            AppRouterNames.otpScreen,
            extra: mobileEditingController.text,
          );
        } else if (state is RegisterFailure) {
          showCustomSnackBar(
            context,
            message: state.errorMessage,
            isError: true,
          );
        }
      },
      builder: (context, state) {
        if (state is RegistrLoading) {
          return CustomLoadingIndicator();
        } else {
          return CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String mobile = mobileEditingController.text;
                String email = emailEditingController.text;
                String name = nameEditingController.text;

                final RegisterRequest sendRequest = RegisterRequest(
                  mobile: mobile,
                  email: email,
                  name: name,
                );

                context.read<RegisterCubit>().register(sendRequest);
              }
            },
            text: 'انشاء حساب',
          );
        }
      },
    );
  }
}
