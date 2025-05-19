import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dialog/bottom_sheet_list_radio_dialog.dart';
import '../text/text_interface.dart';

class IndexDropdown extends StatelessWidget {
  final List<String> items;
  final int selectedValue;
  final ValueChanged<int>? onChanged;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final String title; // 제목을 추가
  final bool isLoading;
  final VoidCallback? onTap;
  final Color color;

  const IndexDropdown(
      {super.key,
      required this.items,
      required this.selectedValue,
      this.onChanged,
      this.width,
      this.height,
      this.title = '',
      this.isLoading = false,
      this.backgroundColor = Colors.white,
      this.color = Colors.black,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    print('isLoading $isLoading');

    final dummyNode = FocusNode();

    return GestureDetector(
      onTap: !isLoading
          ? () {
        FocusScope.of(context)
            .requestFocus(dummyNode);

              (onTap ?? () {})();
              BottomSheetListRadioDialog(
                headerPinned: true,
                context: context,
                selectedValue: selectedValue,
                onChanged: onChanged,
                items: items,
                title: title,
              ).show();
            }
          : () => print('you cannot touch'),
      child: Container(
        padding: EdgeInsets.only(right: 5, left: 15),
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IndexText(
              items[selectedValue],
              color: color,
            ),
            Icon(
              Icons.arrow_drop_down,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
