import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../response/file_response_dto.dart';

part 'file_service.g.dart';

@RestApi()
abstract class FileService {
  factory FileService(Dio dio, {String baseUrl}) = _FileService;

  @GET('/api/file')
  Future<List<FileResponseDTO>?> getFiles(
    @Query('api') String? api,
    @Query('pk') int? pk,
  );

  @POST('/api/file')
  Future<List<FileResponseDTO>?> postFile(
    @Query('api') String? api,
    @Query('pk') int? pk,
    @Part(name: 'file') List<MultipartFile> files,
  );

  @DELETE('/api/file/{id}')
  Future deleteFiles(
    @Path('id') int? pk,
  );
}
