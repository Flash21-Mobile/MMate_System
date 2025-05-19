import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MMateRefreshIndicator extends RefreshIndicator {
  final BuildContext context;
  final double displacementIndex;

  const MMateRefreshIndicator(this.context,
      {super.key,
      required super.child,
      required super.onRefresh,
      this.displacementIndex = 0.0});

  @override
  double get displacement =>
      MediaQuery.of(context).padding.top + displacementIndex;

  @override
  Color? get backgroundColor => Theme.of(context).colorScheme.primaryContainer;

  @override
  Color? get color => Theme.of(context).colorScheme.primary;
}
