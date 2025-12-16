import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/features/advertisements/domain/entities/city.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/selected_city.dart/selected_city_cubit.dart';

class GetCitiesSucessWidget extends StatefulWidget {
  const GetCitiesSucessWidget({super.key, required this.listOfCities});
  final List<City> listOfCities;
  @override
  State<GetCitiesSucessWidget> createState() => _GetCitiesSucessWidgetState();
}

class _GetCitiesSucessWidgetState extends State<GetCitiesSucessWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.listOfCities.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 8.r),
          child: BlocBuilder<SelectedCityCubit, SelectedCityState>(
            builder: (context, state) {
              final isSelected =
                  state is SelectedCitySelected &&
                  state.cityId == widget.listOfCities[index].id;

              return GestureDetector(
                onTap: () {
                  context.read<SelectedCityCubit>().selectCity(
                    widget.listOfCities[index].id,
                  );
                },
                child: Container(
                  height: 50.h,
                  width: 78.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? Constants.kPrimaryColor
                          : Colors.grey.shade300,
                      width: 1.5.r,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      widget.listOfCities[index].name,
                      style: TextStyles.textStyle16.copyWith(
                        color: Colors.black,
                        fontWeight: isSelected
                            ? FontWeight.w400
                            : FontWeight.w100,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
