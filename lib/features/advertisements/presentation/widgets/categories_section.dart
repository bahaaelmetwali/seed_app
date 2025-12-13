import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/get_city/get_city_cubit.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/get_cities_failure_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/get_cities_loading_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/get_cities_sucess_widget.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 24.r),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('المدن', style: TextStyles.textStyle18),
              Spacer(),

              Column(
                children: [
                  Text(
                    'عرض الكل',
                    style: TextStyles.textStyle14.copyWith(
                      color: Constants.kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    height: 1.h,
                    width: 60.w,
                    color: Constants.kPrimaryColor,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 14.h),
          SizedBox(
            height: 56.h,
            child: BlocBuilder<GetCityCubit, GetCityState>(
              builder: (context, state) {
                if (state is GetCitySucess) {
                  return GetCitiesSucessWidget(listOfCities: state.cities);
                } else if (state is GetCityLoading) {
                  return GetCitiesLoadingWidget();
                } else if (state is GetCityFailure) {
                  return GetCitiesFailure(errorMessage: state.errorMessage);
                } else {
                  return Text('يوجد خطأ', style: TextStyles.textStyle20);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
