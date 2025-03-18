import '../account/account_entity.dart';

class GeocoderAccountEntity {
  final AccountEntity accountEntity;
  final double latitude;
  final double longitude;

  GeocoderAccountEntity({
    required this.accountEntity,
    required this.latitude,
    required this.longitude,
  });
}
