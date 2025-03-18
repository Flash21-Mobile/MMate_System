import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config.dart';
import '../text/text_interface.dart';
import 'bottom_sheet_header_delegate.dart';

class BottomSheetListRadioDialog extends StatefulWidget {
  final BuildContext context;
  final Function()? onTap;
  final int selectedValue;
  final Function(int)? onChanged;
  final List<String> items;
  final String title;
  final ScrollController? controller;
  final double maxChildSize;
  final double initialSize;
  final bool autoFocus;
  final bool headerPinned;

  const BottomSheetListRadioDialog(
      {super.key,
      required this.context,
      this.onTap,
      required this.selectedValue,
      this.autoFocus = false,
      this.headerPinned = false,
      required this.onChanged,
      required this.items,
      required this.title,
      this.maxChildSize = 1.0,
      this.initialSize = 0.9,
      this.controller});

  @override
  State<BottomSheetListRadioDialog> createState() => _Widget();

  void show() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: AppConfig.borderRadiusTop),
        useSafeArea: true,
        builder: (context) {
          return DraggableScrollableSheet(
              snap: true,
              expand: false,
              maxChildSize: maxChildSize,
              initialChildSize: initialSize,
              minChildSize: initialSize - 0.1,
              shouldCloseOnMinExtent: true,
              builder: (context, scrollController) {
                if (autoFocus) {
                  Future.delayed(Duration.zero, () {
                    scrollController.jumpTo(selectedValue * 50 - 50);
                  });
                }

                return ClipRRect(
                    borderRadius: AppConfig.borderRadiusTop,
                    child: BottomSheetListRadioDialog(
                      title: title,
                      context: context,
                      onTap: onTap,
                      autoFocus: autoFocus,
                      headerPinned: headerPinned,
                      controller: scrollController,
                      selectedValue: selectedValue,
                      onChanged: onChanged,
                      items: items,
                    ));
              });
        });
  }
}

class _Widget extends State<BottomSheetListRadioDialog> {
  late int selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    print('hello super: $selected');
    return CustomScrollView(
      controller: widget.controller,
      slivers: [
        SliverPersistentHeader(
          pinned: widget.headerPinned,
          floating: false,
          delegate: BottomSheetHeaderDelegate(
            title: widget.title,
            onBack: () => Navigator.pop(context),
          ),
        ),
        SliverList.separated(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppConfig.paddingIndex),
                child: Material(
                    borderRadius: index == 0
                        ? AppConfig.borderRadiusTop
                        : index == widget.items.length - 1
                            ? AppConfig.borderRadiusBottom
                            : null,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: InkWell(
                        borderRadius: index == 0
                            ? AppConfig.borderRadiusTop
                            : index == widget.items.length - 1
                                ? AppConfig.borderRadiusBottom
                                : null,
                        onTap: () {
                          setState(() => selected = index);
                          (widget.onChanged ?? () {})(index);
                          Navigator.of(context).pop();
                        },
                        child: SizedBox(
                            height: 49,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 14),
                                selected == index
                                    ? Icon(
                                        Icons.check_rounded,
                                        color: Theme.of(context).primaryColor,
                                        size: 21,
                                      )
                                    : SizedBox(width: 21),
                                SizedBox(width: 14),
                                IndexText(widget.items[index])
                              ],
                            )))));
          },
          separatorBuilder: (_, __) => Container(
            height: 1,
            margin: EdgeInsets.symmetric(horizontal: AppConfig.paddingIndex),
            color: Theme.of(context).dividerColor,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppConfig.paddingIndex))
      ],
    );
  }
}