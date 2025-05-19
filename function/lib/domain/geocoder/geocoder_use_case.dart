import 'package:function_system/data/geocoder/repository/geocoder_repository.dart';
import 'package:function_system/domain/account/base/base_account_entity.dart';
import 'package:function_system/domain/geocoder/geoceder_account_entity.dart';
import 'package:function_system/utilities/exception/exceoption.dart';

import '../account/entity/account/account_entity.dart';

class GetGeocoderUseCase {
  final GeocoderRepository geocoderRepository;

  const GetGeocoderUseCase(this.geocoderRepository);

  Future<GeocoderAccountEntity> execute(
      AccountEntity account) async {
    try {
      if (account.workAddress.isEmpty) {
        throw MMateException.noData;
      }
      final latLng = await geocoderRepository.getLatLng(account.workAddress);
      if (latLng == null || latLng.isEmpty) {
        throw MMateException.noData;
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
