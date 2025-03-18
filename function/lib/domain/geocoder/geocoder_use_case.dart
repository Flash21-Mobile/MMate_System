import 'package:function_system/data/geocoder/repository/geocoder_repository.dart';
import 'package:function_system/domain/account/account_entity.dart';
import 'package:function_system/domain/geocoder/geoceder_account_entity.dart';
import 'package:function_system/utilities/exception/exceoption.dart';

class GetGeocoderUseCase {
  final GeocoderRepository geocoderRepository;

  const GetGeocoderUseCase(this.geocoderRepository);

  Future<GeocoderAccountEntity> execute(
      AccountEntity account) async {
    try {
      if (account.workAddress.isEmpty) {
        throw MmateException.noData;
      }
      final latLng = await geocoderRepository.getLatLng(account.workAddress);
      if (latLng == null || latLng.isEmpty) {
        throw MmateException.noData;
      }

      return GeocoderAccountEntity(
          accountEntity: account,
          latitude: latLng.first,
          longitude: latLng.last);
    } catch (e) {
      rethrow;
    }
  }
}
