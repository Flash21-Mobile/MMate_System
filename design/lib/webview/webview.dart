import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../text/text_interface.dart';

class MMateWebView extends ConsumerStatefulWidget {
  final String url;

  const MMateWebView(this.url, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MMateWebView();
}

class _MMateWebView extends ConsumerState<MMateWebView> {
  late WebViewController _controller = WebViewController();

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration(milliseconds: 300))
        .then((value) => setState(() => ()));
    Future.delayed(Duration(milliseconds: 500))
        .then((value) => setState(() => ()));
  }

  Future<bool> _onWillPop() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: WebViewWidget(controller: _controller),
    );
  }
}
