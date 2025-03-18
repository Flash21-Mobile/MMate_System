import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../text/text_interface.dart';
import 'list_view_abstract_interface.dart';

abstract class ListViewInterface<T> extends ListViewAbstractInterface<T> {
  const ListViewInterface(
      {super.key,
      required super.itemBuilder,
      super.separateWidget,
      super.width,
      super.height,
      super.padding,
      super.scrollDirection = Axis.vertical,
      super.controller,
      super.shrinkWrap = false,
      super.emptyText,
      required super.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (data == null) {
      return ListView.separated(
          scrollDirection: scrollDirection,
          controller: controller,
          shrinkWrap: shrinkWrap,
          padding: padding,
          itemBuilder: (context, index) =>
              itemBuilder(null, index).listViewItemLoading(),
          separatorBuilder: (_, __) => separateWidget ?? SizedBox(),
          itemCount: 3);
    }

    if (data!.isEmpty) {
      return CustomScrollView(slivers: [
        SliverFillRemaining(child: Center(child: IndexText(emptyText)))
      ]);
    }

    return SizedBox(
        width: width,
        height: height,
        child: ListView.separated(
            scrollDirection: scrollDirection,
            controller: controller,
            shrinkWrap: shrinkWrap,
            padding: padding,
            itemBuilder: (context, index) => itemBuilder(data![index], index),
            separatorBuilder: (_, __) => separateWidget ?? SizedBox(),
            itemCount: data!.length));
  }
}
