import 'package:core_system/community/provider/article/article_provider.dart';
import 'package:core_system/community/provider/board/board_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/utilities/permission_provider.dart';
import 'package:function_system/domain/board/board_entity.dart';
import 'package:function_system/domain/board/board_type.dart';
import 'package:function_system/utilities/navigation/navigation.dart';

class CommunityTab extends ConsumerStatefulWidget {
  const CommunityTab({
    super.key,
    required this.entity,
  });

  final BoardEntity entity;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Widget();
}

class _Widget extends ConsumerState<CommunityTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(articleProvider(widget.entity.id));
    final notifier = ref.read(articleProvider(widget.entity.id).notifier);
    final permission = ref.watch(permissionProvider);
    final boards = ref.read(boardProvider);

    return Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
            onRefresh: () async {
              await notifier.fetchData();
            },
            child: ListView.builder(itemBuilder: (_,__){
              return Text('hello');
            })),
        floatingActionButton:
            permission || widget.entity.type is BoardTypeCommunity
                ? FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.add_rounded),
                    onPressed: () {
                      // context.push(CommunityPostScreen(
                      //   boardId: widget.entity.id,
                      //   boardName: widget.entity.name,
                      //   boardType: widget.entity.firstInfo,
                      // ))
                      //     .then((_) {
                      //   notifier.fetchData();
                      // });
                    })
                : null);
  }
}
