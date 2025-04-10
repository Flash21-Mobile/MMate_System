import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MMateListView extends BoxScrollView {
  MMateListView({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    this.itemExtent,
    this.itemExtentBuilder,
    this.prototypeItem,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    super.cacheExtent,
    List<Widget> children = const <Widget>[],
    int? semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    super.hitTestBehavior,
  })  : assert(
          (itemExtent == null && prototypeItem == null) ||
              (itemExtent == null && itemExtentBuilder == null) ||
              (prototypeItem == null && itemExtentBuilder == null),
          'You can only pass one of itemExtent, prototypeItem and itemExtentBuilder.',
        ),
        childrenDelegate = SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        ),
        super(semanticChildCount: semanticChildCount ?? children.length);

  MMateListView.builder({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    this.itemExtent,
    this.itemExtentBuilder,
    this.prototypeItem,
    required NullableIndexedWidgetBuilder itemBuilder,
    ChildIndexGetter? findChildIndexCallback,
    int? itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    super.cacheExtent,
    int? semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    super.hitTestBehavior,
  })  : assert(itemCount == null || itemCount >= 0),
        assert(semanticChildCount == null || semanticChildCount <= itemCount!),
        assert(
          (itemExtent == null && prototypeItem == null) ||
              (itemExtent == null && itemExtentBuilder == null) ||
              (prototypeItem == null && itemExtentBuilder == null),
          'You can only pass one of itemExtent, prototypeItem and itemExtentBuilder.',
        ),
        childrenDelegate = SliverChildBuilderDelegate(
          itemBuilder,
          findChildIndexCallback: findChildIndexCallback,
          childCount: itemCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        ),
        super(semanticChildCount: semanticChildCount ?? itemCount);

  MMateListView.separated({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    required NullableIndexedWidgetBuilder itemBuilder,
    ChildIndexGetter? findChildIndexCallback,
    required IndexedWidgetBuilder separatorBuilder,
    required int itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    super.hitTestBehavior,
  })  : assert(itemCount >= 0),
        itemExtent = null,
        itemExtentBuilder = null,
        prototypeItem = null,
        childrenDelegate = SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final int itemIndex = index ~/ 2;
            if (index.isEven) {
              return itemBuilder(context, itemIndex);
            }
            return separatorBuilder(context, itemIndex);
          },
          findChildIndexCallback: findChildIndexCallback,
          childCount: _computeActualChildCount(itemCount),
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          semanticIndexCallback: (Widget widget, int index) {
            return index.isEven ? index ~/ 2 : null;
          },
        ),
        super(semanticChildCount: itemCount);

  const MMateListView.custom({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    this.itemExtent,
    this.prototypeItem,
    this.itemExtentBuilder,
    required this.childrenDelegate,
    super.cacheExtent,
    super.semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    super.hitTestBehavior,
  }) : assert(
          (itemExtent == null && prototypeItem == null) ||
              (itemExtent == null && itemExtentBuilder == null) ||
              (prototypeItem == null && itemExtentBuilder == null),
          'You can only pass one of itemExtent, prototypeItem and itemExtentBuilder.',
        );

  final double? itemExtent;
  final ItemExtentBuilder? itemExtentBuilder;
  final Widget? prototypeItem;
  final SliverChildDelegate childrenDelegate;

  @override
  Widget buildChildLayout(BuildContext context) {
    if (itemExtent != null) {
      return SliverFixedExtentList(
          delegate: childrenDelegate, itemExtent: itemExtent!);
    } else if (itemExtentBuilder != null) {
      return SliverVariedExtentList(
        delegate: childrenDelegate,
        itemExtentBuilder: itemExtentBuilder!,
      );
    } else if (prototypeItem != null) {
      return SliverPrototypeExtentList(
          delegate: childrenDelegate, prototypeItem: prototypeItem!);
    }
    return SliverList(delegate: childrenDelegate);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DoubleProperty('itemExtent', itemExtent, defaultValue: null));
  }

  static int _computeActualChildCount(int itemCount) {
    return math.max(0, itemCount * 2 - 1);
  }
}

abstract class BoxScrollView extends ScrollView {
  /// Creates a [ScrollView] uses a single child layout model.
  ///
  /// If the [primary] argument is true, the [controller] must be null.
  const BoxScrollView({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    this.padding,
    super.cacheExtent,
    super.semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    super.hitTestBehavior,
  });

  /// The amount of space by which to inset the children.
  final EdgeInsetsGeometry? padding;

  @override
  List<Widget> buildSlivers(BuildContext context) {
    Widget sliver = buildChildLayout(context);
    EdgeInsetsGeometry? effectivePadding = padding;
    if (padding == null) {
      final MediaQueryData? mediaQuery = MediaQuery.maybeOf(context);
      if (mediaQuery != null) {
        // Automatically pad sliver with padding from MediaQuery.
        final EdgeInsets mediaQueryHorizontalPadding =
            mediaQuery.padding.copyWith(
          top: 0.0,
          bottom: 0.0,
        );
        final EdgeInsets mediaQueryVerticalPadding =
            mediaQuery.padding.copyWith(
          left: 0.0,
          right: 0.0,
        );
        // Consume the main axis padding with SliverPadding.
        effectivePadding = scrollDirection == Axis.vertical
            ? mediaQueryVerticalPadding
            : mediaQueryHorizontalPadding;
        // Leave behind the cross axis padding.
        sliver = MediaQuery(
          data: mediaQuery.copyWith(
            padding: scrollDirection == Axis.vertical
                ? mediaQueryHorizontalPadding
                : mediaQueryVerticalPadding,
          ),
          child: sliver,
        );
      }
    } else {
      final MediaQueryData? mediaQuery = MediaQuery.maybeOf(context);
      if (mediaQuery != null) {
        final EdgeInsets mediaQueryHorizontalPadding = mediaQuery.padding
            .copyWith(
                top: (padding as EdgeInsets).top,
                bottom: (padding as EdgeInsets).bottom,
                left: mediaQuery.padding.left + (padding as EdgeInsets).left,
                right:
                    mediaQuery.padding.right + (padding as EdgeInsets).right);
        final EdgeInsets mediaQueryVerticalPadding = mediaQuery.padding
            .copyWith(
                left: (padding as EdgeInsets).left,
                right: (padding as EdgeInsets).right,
                top: mediaQuery.padding.top + (padding as EdgeInsets).top,
                bottom:
                    mediaQuery.padding.bottom + (padding as EdgeInsets).bottom);
        // Consume the main axis padding with SliverPadding.
        effectivePadding = scrollDirection == Axis.vertical
            ? mediaQueryVerticalPadding
            : mediaQueryHorizontalPadding;
        // Leave behind the cross axis padding.
        sliver = MediaQuery(
          data: mediaQuery.copyWith(
            padding: scrollDirection == Axis.vertical
                ? mediaQueryHorizontalPadding
                : mediaQueryVerticalPadding,
          ),
          child: sliver,
        );
      }
    }

    if (effectivePadding != null) {
      sliver = SliverPadding(padding: effectivePadding, sliver: sliver);
    }
    return <Widget>[sliver];
  }

  /// Subclasses should override this method to build the layout model.
  @protected
  Widget buildChildLayout(BuildContext context);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding,
        defaultValue: null));
  }
}
