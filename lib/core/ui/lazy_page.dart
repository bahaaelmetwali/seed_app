import 'package:flutter/material.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/core/ui/not_authorized_widget.dart';
import 'package:seed_app/features/auth/data/data_source/local_data_source.dart';

class LazyPage extends StatelessWidget {
  final bool isSelected;
  final Widget child;
  final bool requireAuth;

  const LazyPage({
    super.key,
    required this.isSelected,
    required this.child,
     this.requireAuth=true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isSelected) {
      return const SizedBox.shrink();
    }

    if (!requireAuth) {
      return child;
    }

    final userType = getIt<LocalDataSource>().getType(); 

    if (userType == 'user') {
      return child;
    }

    return const NotAuthorizedWidget();
  }
}
