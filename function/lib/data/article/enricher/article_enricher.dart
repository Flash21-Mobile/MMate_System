import 'package:function_system/data/account/enricher/account_enricher.dart';

import '../../../domain/article/entity/article/article.dart';
import '../../../utilities/date_format.dart';
import '../../favorite/data/repository/favorite_repository.dart';
import '../response/article_response_dto.dart';

class ArticleEnricher {
  final AccountEnricher _accountEnricher;

  const ArticleEnricher(this._accountEnricher);

  Article enrich(ArticleResponseDto dto) {
    return Article(
      id: dto.id,
      board: dto.board!.toEntity(),
      content: dto.content ?? '',
      title: dto.title ?? '',
      viewCnt: dto.viewCnt ?? 0,
      account: _accountEnricher.enrich(dto.account!),
      time: dto.time,
    );
  }
}
