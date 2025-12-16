import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/log_out_stream.dart';
import 'package:seed_app/core/router/app_router.dart';
import 'package:seed_app/core/router/app_router_names.dart';
import 'package:seed_app/core/service_locator.dart';

class SeedApp extends StatelessWidget {
  const SeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return StreamBuilder<String>(
          stream: getIt<LogoutStream>().stream,
          builder: (context, snapshot) {
            if (snapshot.data == 'logout') {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppRouter.router.go(AppRouterNames.loginScreen);
              });
            }
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
            );
          },
        );
      },
    );
  }
}
