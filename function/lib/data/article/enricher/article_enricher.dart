import 'package:function_system/data/account/enricher/account_enricher.dart';

import '../../../domain/aricle/entity/article/article_entity.dart';
import '../../../utilities/date_format.dart';
import '../../favorite/data/repository/favorite_repository.dart';
import '../response/article_response_dto.dart';

class ArticleEnricher {
  final AccountEnricher _accountEnricher;

  const ArticleEnricher(this._accountEnricher);

  ArticleEntity enrich(ArticleResponseDto dto) {
    return ArticleEntity(
      id: dto.id!,
      board: dto.board!.toEntity(),
      content: dto.content ?? '',
      title: dto.title ?? '',
      viewCnt: dto.viewCnt ?? 0,
      account: _accountEnricher.enrich(dto.account!),
      time: MMateDateFormat.formatStringToDateTime(dto.time),
    );
  }
}
