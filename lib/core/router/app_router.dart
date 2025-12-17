import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seed_app/core/router/app_router_names.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/features/auth/data/data_source/local_data_source.dart';
import 'package:seed_app/features/auth/presentation/views/login_screen.dart';
import 'package:seed_app/features/auth/presentation/views/otp_screen.dart';
import 'package:seed_app/features/auth/presentation/views/register_screen.dart';
import 'package:seed_app/features/user_navigation.dart';

abstract class AppRouter {
  static bool checkTokenAvailability() {
    final String? token = getIt<LocalDataSource>().getToken();
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static final bool isTokenAvailable = checkTokenAvailability();
  static final GoRouter router = GoRouter(
    initialLocation: isTokenAvailable
        ? AppRouterNames.homeUserScreen
        : AppRouterNames.loginScreen,

    routes: <RouteBase>[
      GoRoute(
        path: AppRouterNames.loginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.registerScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.otpScreen,
        builder: (BuildContext context, GoRouterState state) {
          final String phoneNumber = state.extra as String;
          return OtpScreen(phoneNumber: phoneNumber);
        },
      ),

      GoRoute(
        path: AppRouterNames.homeUserScreen,
        builder: (context, state) => const UserNavigation(currentIndex: 0),
      ),
      GoRoute(
        path: AppRouterNames.myAdvertisments,
        builder: (context, state) => const UserNavigation(currentIndex: 1),
      ),
      GoRoute(
        path: AppRouterNames.addAdvertisment,
        builder: (context, state) => const UserNavigation(currentIndex: 2),
      ),
      GoRoute(
        path: AppRouterNames.moreScreen,
        builder: (context, state) => const UserNavigation(currentIndex: 3),
      ),
    ],
  );
}
