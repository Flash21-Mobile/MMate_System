import 'package:design_system/dialog/bottom_sheet_header_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import '../text/text_interface.dart';
import 'bottom_sheet_list_section.dart';

class BottomSheetListDialog extends StatefulWidget {
  final BuildContext context;
  final Function()? onTap;
  final int selectedValue;
  final Function(int, int)? onSelected;
  final List<BottomSheetListSection<String>> items;
  final String title;
  final ScrollController? scrollController;

  const BottomSheetListDialog(
      {super.key,
      required this.context,
      this.onTap,
      required this.selectedValue,
      required this.onSelected,
      required this.items,
      required this.title,
      this.scrollController});

  @override
  State<BottomSheetListDialog> createState() => _Widget();

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
              maxChildSize: 1.0,
              initialChildSize: 0.7,
              minChildSize: 0.69,
              shouldCloseOnMinExtent: true,
              builder: (context, scrollController) => ClipRRect(
                  borderRadius: AppConfig.borderRadiusTop,
                  child: BottomSheetListDialog(
                    title: title,
                    context: context,
                    onTap: onTap,
                    scrollController: scrollController,
                    selectedValue: selectedValue,
                    onSelected: onSelected,
                    items: items,
                  )));
        });
  }
}

class _Widget extends State<BottomSheetListDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: BottomSheetHeaderDelegate(
            title: widget.title,
            onBack: () => Navigator.pop(context),
          ),
        ),
        SliverList.separated(
            itemCount: widget.items.length,
            itemBuilder: (context, superIndex) {
              return Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                    padding:EdgeInsets.only(left: AppConfig.paddingIndex * 1.5),
                    child: Row(children: [
                      IndexTextMin(widget.items[superIndex].title,color: Theme.of(context).dividerColor,)
                    ])),
                SizedBox(height: 5,),
                ...widget.items[superIndex].items.asMap().entries.expand((e) {
                  return [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConfig.paddingIndex),
                        child: Material(
                            borderRadius:
                                widget.items[superIndex].items.length == 1
                                    ? AppConfig.borderRadius
                                    : e.key == 0
                                        ? AppConfig.borderRadiusTop
                                        : e.key ==
                                                widget.items[superIndex].items
                                                        .length -
                                                    1
                                            ? AppConfig.borderRadiusBottom
                                            : null,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: InkWell(
                                borderRadius:
                                    widget.items[superIndex].items.length == 1
                                        ? AppConfig.borderRadius
                                        : e.key == 0
                                            ? AppConfig.borderRadiusTop
                                            : e.key ==
                                                    widget.items[superIndex]
                                                            .items.length -
                                                        1
                                                ? AppConfig.borderRadiusBottom
                                                : null,
                                onTap: () {
                                  Navigator.of(context).pop();
                                  (widget.onSelected ?? () {})(
                                      superIndex, e.key);
                                },
                                child: SizedBox(
                                    height: 49,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(width: AppConfig.paddingIndex),
                                        IndexText(widget
                                            .items[superIndex].items[e.key])
                                      ],
                                    ))))),
                    e.key != widget.items[superIndex].items.length - 1
                        ? Container(
                            height: 1,
                            margin: EdgeInsets.symmetric(
                                horizontal: AppConfig.paddingIndex),
                            color: Theme.of(context).dividerColor,
                          )
                        : SizedBox(),
                  ];
                })
              ]);
            },
            separatorBuilder: (_, __) =>
                SizedBox(height: AppConfig.paddingIndex)),
        SliverToBoxAdapter(child: SizedBox(height: AppConfig.paddingIndex))
      ],
    );
  }
}
