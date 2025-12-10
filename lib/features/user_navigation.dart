import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/features/advertisements/presentation/screens/home_screen.dart';
import 'package:seed_app/features/other_screens/add_advertisment.dart';
import 'package:seed_app/features/other_screens/more_screen.dart';
import 'package:seed_app/features/other_screens/my_advertisment.dart';

class UserNavigation extends StatefulWidget {
  const UserNavigation({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  State<UserNavigation> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserNavigation> {
  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  final List<Widget> screens = [
    HomeScreen(),
    MyAdvertisment(),
    AddAdvertisment(),
    MoreScreen(),
  ];
  late int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),

          child: BottomNavigationBar(
            backgroundColor: Constants.kPrimaryColor,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Color(0xffb2d5f1),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  colorFilter: ColorFilter.mode(
                    currentIndex == 0 ? Colors.white : const Color(0xffb2d5f1),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/my_advertiments.svg',
                  colorFilter: ColorFilter.mode(
                    currentIndex == 1 ? Colors.white : const Color(0xffb2d5f1),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'اعلاناتي',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/add.svg',
                  colorFilter: ColorFilter.mode(
                    currentIndex == 2 ? Colors.white : const Color(0xffb2d5f1),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'اضافة اعلان',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/more.svg',
                  colorFilter: ColorFilter.mode(
                    currentIndex == 3 ? Colors.white : const Color(0xffb2d5f1),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'المزيد',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
