import 'package:design_system/config.dart';
import 'package:design_system/listview/list_view_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:function_system/domain/aricle/entity/article_entity.dart';

class CommunityListView extends ListViewInterface<ArticleEntity> {
  const CommunityListView({
    super.key,
    required super.itemBuilder,
    required super.separateWidget,
    required super.data,
  }) : super(
          padding:
              const EdgeInsets.only(top: AppConfig.paddingIndex, bottom: 100,),
        );
}
