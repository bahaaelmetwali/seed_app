import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_app/constants/assets.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/widgets/lazy_page.dart';
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

  List<Widget> screens(int currentIndex) {
    return [
      LazyPage(isSelected: currentIndex == 0, child: HomeScreen()),
      LazyPage(isSelected: currentIndex == 1, child: MyAdvertisment()),
      LazyPage(isSelected: currentIndex == 2, child: AddAdvertisment()),
      LazyPage(isSelected: currentIndex == 3, child: MoreScreen()),
    ];
  }

  late int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens(currentIndex),
        ),

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
                  Assets.iconsHome,
                  colorFilter: ColorFilter.mode(
                    currentIndex == 0 ? Colors.white : const Color(0xffb2d5f1),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.iconsMyAdvertiments,
                  colorFilter: ColorFilter.mode(
                    currentIndex == 1 ? Colors.white : const Color(0xffb2d5f1),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'اعلاناتي',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.iconsAdd,
                  colorFilter: ColorFilter.mode(
                    currentIndex == 2 ? Colors.white : const Color(0xffb2d5f1),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'اضافة اعلان',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.iconsMore,
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
