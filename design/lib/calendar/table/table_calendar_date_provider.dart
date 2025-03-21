import 'package:flutter_riverpod/flutter_riverpod.dart';

final tableCalendarDateProvider = StateProvider<DateTime>((ref)=> DateTime.now());