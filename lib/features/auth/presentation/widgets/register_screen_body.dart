import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:seed_app/core/router/app_router_names.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/core/widgets/custom_buttons.dart';
import 'package:seed_app/core/widgets/custom_loading_indicator.dart';
import 'package:seed_app/core/widgets/custom_navigation_button.dart';
import 'package:seed_app/core/widgets/show_custom_snack_bar.dart';
import 'package:seed_app/features/auth/domain/entity/register_request.dart';
import 'package:seed_app/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:seed_app/features/auth/presentation/widgets/agree_conditions_and_terms_widget.dart';
import 'package:seed_app/features/auth/presentation/widgets/back_ground_widget.dart';
import 'package:seed_app/features/auth/presentation/widgets/custom_text_form_fields.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  bool isAgreed = false;

  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final mobileEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final isLoading = state is RegistrLoading;
          return AbsorbPointer(
            absorbing: isLoading,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BackGroundWidget(),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.r),
                          topRight: Radius.circular(40.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(30.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5.h),
                            Text(
                              'إنشاء حساب',
                              style: TextStyles.textStyle20.copyWith(
                                color: Constants.kPrimaryColor,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              'ادخل بياناتك وقم بانشاء حساب خاص بك',
                              style: TextStyles.textStyle18.copyWith(
                                color: Color(0xff6A6A6A),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            CustomTextFormFieldsSection(
                              nameEditingController: nameEditingController,
                              mobileEditingController: mobileEditingController,
                              emailEditingController: emailEditingController,
                            ),
                            SizedBox(height: 20.h),

                            AgreeConditionsAndTermsWidget(
                              isAgreed: isAgreed,
                              onChanged: (_) {
                                setState(() {
                                  isAgreed = !isAgreed;
                                });
                              },
                              onTap: () {
                                setState(() {
                                  isAgreed = true;
                                });
                              },
                            ),

                            SizedBox(height: 20.h),
                            CustomButton(onPressed: () {}, text: 'انشاء حساب'),
                            CustomNavigationButton(
                              solidText: 'لديك حساب بالفعل ؟ ',
                              navigationText: 'تسجيل الدخول',
                              lineWidth: 80,
                              onPressed: () {
                                context.go(AppRouterNames.loginScreen);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

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
