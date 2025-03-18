import 'package:flutter/cupertino.dart';

abstract class ListViewItemInterface<T> extends StatelessWidget {
  const ListViewItemInterface(
      {super.key, required this.data, this.index, this.width = 0, this.onTap,this.backgroundColor});

  final T? data;
  final int? index;
  final double width;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  Widget listViewItemWidget();

  Widget listViewItemLoading();   // todo c: context추가하기

  @override
  Widget build(BuildContext context) {
    return listViewItemWidget();
  }
}
