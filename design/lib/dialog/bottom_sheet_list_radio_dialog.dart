import 'package:flutter/material.dart';

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

  // final ScrollController? controller;
  final double maxChildSize;
  final double initialSize;
  final bool autoFocus;
  final bool headerPinned;

  const BottomSheetListRadioDialog({
    super.key,
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
    // this.controller
  });

  @override
  State<BottomSheetListRadioDialog> createState() => _Widget();

  void show() {
    showDialog(
        context: context,
        // isScrollControlled: true,
        // enableDrag: true,
        //
        // shape: RoundedRectangleBorder(borderRadius: AppConfig.borderRadiusTop),
        useSafeArea: true,
        builder: (context) {
          return Dialog(
              // snap: true,
              // expand: false,
              // maxChildSize: maxChildSize,
              // initialChildSize: initialSize,
              // minChildSize: initialSize - 0.1,
              // shouldCloseOnMinExtent: true,
              insetPadding: EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                  borderRadius: AppConfig.borderRadius,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 3 * 2,
                      child: BottomSheetListRadioDialog(
                        title: title,
                        context: context,
                        onTap: onTap,
                        autoFocus: autoFocus,
                        headerPinned: headerPinned,
                        selectedValue: selectedValue,
                        onChanged: onChanged,
                        items: items,
                      ))));
        });
  }
}

class _Widget extends State<BottomSheetListRadioDialog> {
  late int selected;

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    selected = widget.selectedValue;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(
        50.0 * widget.selectedValue,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: CustomScrollView(
          controller: scrollController,
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
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConfig.paddingIndex),
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
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
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
                margin:
                    EdgeInsets.symmetric(horizontal: AppConfig.paddingIndex),
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
                    height: AppConfig.paddingIndex +
                        MediaQuery.of(context).padding.bottom))
          ],
        ));
  }
}
