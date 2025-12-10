import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seed_app/core/router/app_router_names.dart';
import 'package:seed_app/features/auth/presentation/views/login_screen.dart';
import 'package:seed_app/features/auth/presentation/views/otp_screen.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouterNames.loginScreen,

    routes: <RouteBase>[
      GoRoute(
        path: AppRouterNames.loginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.otpScreen,
        builder: (BuildContext context, GoRouterState state) {
          final String phoneNumber = state.extra as String;
          return OtpScreen(phoneNumber: phoneNumber);
        },
      ),
    ],
  );
}
