import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../text/text_interface.dart';
import 'list_view_abstract_interface.dart';

abstract class SliverListViewInterface<T> extends ListViewAbstractInterface<T> {
  const SliverListViewInterface(
      {super.key,
      required super.itemBuilder,
      super.separateWidget,
      required super.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (data == null) {
      return SliverList.separated(
          itemBuilder: (context, index) =>
              itemBuilder(null, index).listViewItemLoading(),
          separatorBuilder: (_, __) => separateWidget ?? SizedBox(),
          itemCount: 3);
    }

    if (data!.isEmpty) {
      return SliverToBoxAdapter(child: Center(child: IndexText(emptyText)));
    }

    return SliverList.separated(
        itemBuilder: (context, index) => itemBuilder(data![index], index),
        separatorBuilder: (_, $) => separateWidget ?? SizedBox(),
        itemCount: data!.length);
  }
}
