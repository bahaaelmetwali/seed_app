import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/features/advertisements/domain/entities/city.dart';

class GetCitiesSucessWidget extends StatefulWidget {
  const GetCitiesSucessWidget({super.key, required this.listOfCities});
  final List<City> listOfCities;
  @override
  State<GetCitiesSucessWidget> createState() => _GetCitiesSucessWidgetState();
}

class _GetCitiesSucessWidgetState extends State<GetCitiesSucessWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.listOfCities.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 8.r),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              height: 50.h,
              width: 78.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedIndex == index
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
                    fontWeight: selectedIndex == index
                        ? FontWeight.w400
                        : FontWeight.w100,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
