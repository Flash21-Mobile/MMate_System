import 'package:function_system/domain/account/entity/account/account.dart';
import 'package:function_system/domain/article/entity/article/article.dart';

import '../../../data/article/enricher/article_enricher.dart';
import '../../../data/article/repository/article_repository.dart';
import '../../../data/file/repository/file_repository.dart';
import '../../../key/constants_key.dart';
import '../../../utilities/exception/exception.dart';
import '../../uint_file/entity/uint_file.dart';

class PostArticleUseCase {
  final ArticleRepository _repository;
  final ArticleEnricher _articleEnricher;
  final FileRepository _fileRepository;

  PostArticleUseCase(
    this._repository,
    this._articleEnricher,
    this._fileRepository,
  );

  Future<Article> execute(
      {required int accountId,
      required int boardPk,
      required String title,
      required String content,
      required DateTime time,
      bool sendPushAlarm = false,
      List<UintFile> images = const [],
      bool isSkipUploadImage = false}) async {
    try {
      final result = await _repository.postArticle(
        accountPk: accountId,
        boardPk: boardPk,
        title: title,
        content: content,
        time: time,
        sendPushAlarm: sendPushAlarm,
      );

      if (images.isNotEmpty) {
        if (isSkipUploadImage) {
          _fileRepository.post(ConstantsKey.articleImagesAPI, result.id,
              images.map((e) => e.toMultipart()).toList());
        } else {
          final fileResult = await _fileRepository.post(
              ConstantsKey.articleImagesAPI,
              result.id,
              images.map((e) => e.toMultipart()).toList());

          if (fileResult.first.id == null) throw MMateException.failedSend;
        }
      }

      return _articleEnricher.enrich(result);
    } catch (e) {
      rethrow;
    }
  }
}
