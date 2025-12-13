import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/core/widgets/custom_buttons.dart';
import 'package:seed_app/core/widgets/custom_navigation_button.dart';
import 'package:seed_app/core/widgets/custom_text_form_field.dart';
import 'package:seed_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:seed_app/features/auth/presentation/cubits/login/login_state.dart';
import 'package:seed_app/features/auth/presentation/widgets/back_ground_widget.dart';
import 'package:seed_app/features/auth/presentation/widgets/login_process.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final mobileEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        bool isLoading = state is LoginLoading;
        return Form(
          key: _formKey,
          child: AbsorbPointer(
            absorbing: isLoading,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BackGroundWidget(),
                    Container(
                      height: 620.h,
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
                            SizedBox(height: 10.h),
                            Text(
                              'مرحبا بك !',
                              style: TextStyles.textStyle20.copyWith(
                                color: Constants.kPrimaryColor,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'قم بإنشاء حساب جديد',
                              style: TextStyles.textStyle18.copyWith(
                                color: Color(0xff6A6A6A),
                              ),
                            ),
                            SizedBox(height: 40.h),
                            CustomTextFormField(
                              name: 'الاسم',
                              hintText: 'ادخل الاسم',
                              controller: nameEditingController,
                            ),
                            SizedBox(height: 20.h),
                            CustomTextFormField(
                              name: 'البريد الإلكتروني',
                              hintText: 'ادخل البريد الإلكتروني',
                              controller: emailEditingController,
                            ),
                            SizedBox(height: 20.h),
                            CustomTextFormField(
                              name: 'رقم الجوال',
                              hintText: 'ادخل رقم الجوال',
                              controller: mobileEditingController,
                            ),
                            SizedBox(height: 20.h),
                            CustomTextFormField(
                              name: 'كلمة المرور',
                              hintText: 'ادخل كلمة المرور',
                              controller: passwordEditingController,
                            ),
                            SizedBox(height: 40.h),
                            LoginProcess(
                              mobileEditingController: mobileEditingController,
                              formKey: _formKey,
                            ),
                            CustomNavigationButton(
                              solidText: 'تسجيل الدخول',
                              navigationText: 'لديك حساب بالفعل ؟',
                              onPressed: () {},
                            ),
                            Spacer(),
                            CustomButton(
                              onPressed: () {},
                              text: 'الدخول كزائر',
                              isMainColor: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
