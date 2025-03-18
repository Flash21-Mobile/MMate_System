import 'package:dio/dio.dart';

import 'geocoder_repository.dart';

class GeocoderRepositoryImpl extends GeocoderRepository {
  @override
  Future<List<double>?> getLatLng(String address) async {
    String defaultUrl =
        'https://dapi.kakao.com/v2/local/search/address.json?&query=';
    try {
      String url = defaultUrl + address;

      var res = await Dio(BaseOptions(headers: {
        'Authorization': 'KakaoAK 24e8828cd107b700d56d2321d1a77226',
      })).get(url);

      var result = res.data;
      var x = result['documents'][0]['x'];
      var y = result['documents'][0]['y'];
      return [double.parse(y), double.parse(x)];
    } catch (e) {
      rethrow;
    }
  }
}
