import 'package:daum_postcode_search/daum_postcode_search.dart';
import 'package:flutter/material.dart';


class GetAddress extends StatefulWidget {
  const GetAddress({super.key});

  @override
  State<StatefulWidget> createState() => _Widget();

  static Future<DataModel> get(BuildContext context) async {
    return await Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: Duration.zero, // 애니메이션 제거
        reverseTransitionDuration: Duration.zero,
        pageBuilder: (context, animation, secondaryAnimation) {
          return GetAddress();
        }));
  }
}

class _Widget extends State<GetAddress> {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    DaumPostcodeSearch daumPostcodeSearch =
        DaumPostcodeSearch(onConsoleMessage: (_, message) => ());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          // title: IndexTextMax('주소 검색'),
          backgroundColor: Colors.white,
        ),
        body: Column(children: [
          Expanded(
            child: daumPostcodeSearch,
          ),
        ]));
  }
}
