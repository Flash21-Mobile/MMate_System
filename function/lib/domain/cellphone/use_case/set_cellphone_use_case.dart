import '../../../data/sign/repository/sign_repository.dart';

class SetCellphoneUseCase {
  final SignRepository repository;

  const SetCellphoneUseCase(this.repository);

  Future execute(String cellphone) async {
    try {
      await repository.setCellphone(cellphone);
    } catch (e) {
      rethrow;
    }
  }
}
