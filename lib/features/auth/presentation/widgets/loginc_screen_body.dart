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

class LogincScreenBody extends StatefulWidget {
  const LogincScreenBody({super.key});

  @override
  State<LogincScreenBody> createState() => _LogincScreenBodyState();
}

class _LogincScreenBodyState extends State<LogincScreenBody> {
  final mobileEditingController = TextEditingController();
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
                              'قم بتسجيل دخولك مرة اخرى',
                              style: TextStyles.textStyle18.copyWith(
                                color: Color(0xff6A6A6A),
                              ),
                            ),
                            SizedBox(height: 40.h),
                            CustomTextFormField(
                              name: 'رقم الجوال',
                              hintText: 'ادخل رقم الجوال',
                              controller: mobileEditingController,
                            ),
                            SizedBox(height: 40.h),
                            LoginProcess(
                              mobileEditingController: mobileEditingController,
                              formKey: _formKey,
                            ),
                            CustomNavigationButton(
                              solidText: 'إنشاء حساب',
                              navigationText: 'ليس لديك حساب ؟',
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
