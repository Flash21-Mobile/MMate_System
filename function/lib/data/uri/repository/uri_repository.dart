abstract class UriRepository {
  Future<String?> pickSingleImage();
  Future<List<String>> pickMultipleImages();
  Future<String?> pickFile();
}