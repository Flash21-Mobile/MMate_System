abstract class GeocoderRepository {
  Future<List<double>?> getLatLng(String address);
}
