import 'package:design_system/textfield/index_text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:unorm_dart/unorm_dart.dart' as unorm;

import '../utilities/config.dart';

class IndexSearchBox<T> extends HookWidget {
  final Function(List<T> items) onChanged;
  final List<String> Function(T value) searchItem;
  final List<T> items;
  final FocusNode? focusNode;
  final double height;

  const IndexSearchBox({
    super.key,
    this.focusNode,
    this.height = kToolbarHeight,
    required this.onChanged,
    required this.searchItem,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    useEffect(() {
      void listener() {
        if (searchController.text.isEmpty) {
          onChanged(items);
          return;
        }
        final searchedList = items.where((e) {
          final target = unorm.nfc(searchItem(e).join(' '));
          final query = unorm.nfc(searchController.text);

          return target.contains(query);
        }).toList();

        onChanged(searchedList);
      }

      searchController.addListener(listener);
      return () {
        searchController.removeListener(listener);
      };
    }, [items]);

    return IndexTextField(
      hintText: '검색..',
      controller: searchController,
      focusNode: focusNode,
      height: height,
      maxLength: 15,
      padding: IndexPadding(left: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
