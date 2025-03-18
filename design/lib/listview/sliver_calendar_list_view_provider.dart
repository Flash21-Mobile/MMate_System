import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliverCalendarListViewProvider =
StateNotifierProvider<_Viewmodel, DateTime>((ref) {
  return _Viewmodel();
});

class _Viewmodel extends StateNotifier<DateTime> {

  _Viewmodel() : super(DateTime.now());

  set set(DateTime date)=> state = date;
}
