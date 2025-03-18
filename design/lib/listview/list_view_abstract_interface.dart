import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../listviewitem/list_view_item_interface.dart';

abstract class ListViewAbstractInterface<T> extends ConsumerWidget {
  final ListViewItemInterface<T> Function(T? data, int index) itemBuilder;
  final Widget? separateWidget;
  final EdgeInsets? padding;
  final Axis scrollDirection;
  final ScrollController? controller;
  final bool shrinkWrap;
  final List<T?>? data;
  final double? width;
  final double? height;
  final String emptyText;

  const ListViewAbstractInterface(
      {super.key,
        required this.itemBuilder,
        this.separateWidget,
        this.width,
        this.height,
        this.padding,
        this.scrollDirection = Axis.vertical,
        this.controller,
        this.shrinkWrap = false,
        this.emptyText = '데이터가 없습니다',
        required this.data});

}