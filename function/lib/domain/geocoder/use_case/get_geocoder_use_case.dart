import 'package:function_system/data/geocoder/repository/geocoder_repository.dart';
import 'package:function_system/domain/geocoder/geocoder/geocoder.dart';
import 'package:function_system/utilities/exception/exception.dart';

import '../../account/entity/account/account.dart';

class GetGeocoderUseCase {
  final GeocoderRepository geocoderRepository;

  const GetGeocoderUseCase(this.geocoderRepository);

  Future<Geocoder> execute(Account account) async {
    try {
      if (account.workAddress.isEmpty) {
        throw MMateException.noData;
      }
      final latLng = await geocoderRepository.getLatLng(account.workAddress);
      if (latLng == null || latLng.isEmpty) {
        throw MMateException.noData;
      }

      return Geocoder(
          accountEntity: account,
          lat: latLng.first,
          lng: latLng.last);
    } catch (e) {
      rethrow;
    }
  }
}
