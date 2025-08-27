import 'package:flutter/material.dart';

enum ToastType {
  normal(null),
  error(Icons.cancel_rounded);

  final IconData? icon;

  const ToastType(this.icon);
}
