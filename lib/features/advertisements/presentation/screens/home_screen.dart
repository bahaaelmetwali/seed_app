import 'package:flutter/material.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kscaffoldColor,
      body: SafeArea(child: HomeScreenBody()),
    );
  }
}
