import 'package:intl/intl.dart';

extension IntFormat on int {
  String? toFeatureString() {
    String result = NumberFormat('#,###').format(this);
    return result;
  }
}
