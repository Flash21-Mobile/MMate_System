import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../response/uint_file_response_dto.dart';

part 'uint_file_service.g.dart';

@RestApi()
abstract class UintFileService {
  factory UintFileService(Dio dio, {String baseUrl}) = _UintFileService;

  @GET('/api/file')
  Future<List<UintFileResponseDto>?> get(
      @Query('api') String? api,
      @Query('pk') int? pk,
      );

  @POST('/api/file')
  Future<List<UintFileResponseDto>?> post(
      @Query('api') String? api,
      @Query('pk') int? pk,
      @Part(name: 'file') List<MultipartFile> files,
      );

  @DELETE('/api/file/{id}')
  Future delete(
      @Path('id') int? pk,
      );
}
