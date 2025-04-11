import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MMateRefreshIndicator extends RefreshIndicator {
  final BuildContext context;

  const MMateRefreshIndicator(
    this.context, {
    super.key,
    required super.child,
    required super.onRefresh,
  });

  @override
  double get displacement => MediaQuery.of(context).padding.top;
}
