
import 'package:file_picker/file_picker.dart';

import 'uri_repository.dart';

class UriRepositoryImpl extends UriRepository {
  @override
  Future<String?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false
    );

    if (result != null) {
      return result.files.single.path!;
    } else {
      return null;
    }
  }

  @override
  Future<List<String>> pickMultipleImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    return result?.files.map((file) => file.path!).toList() ?? [];
  }

  @override
  Future<String?> pickSingleImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    return result?.files.single.path;
  }
}
