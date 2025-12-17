import 'package:flutter/material.dart';

class LazyPage extends StatelessWidget {
  final bool isSelected;
  final Widget child;

  const LazyPage({
    required this.isSelected,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected ? child : const SizedBox.shrink();
  }
}