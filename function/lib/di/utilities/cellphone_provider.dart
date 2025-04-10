import 'package:function_system/di/utilities/get_my_cellphone_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cellphone_provider.g.dart';

@Riverpod(keepAlive: true)
class Cellphone extends _$Cellphone {
  @override
  String? build() {
    return null;
  }

  Future _fetch() async {
    try {
      final useCase = ref.watch(getMyCellphoneProvider);

      final result = await useCase.execute();

      state = result;
    } catch (e) {
      state = null;
    }
  }

  Future fetchData() async => _fetch();

  Future putData(String cellphone) async => state = cellphone;
}
