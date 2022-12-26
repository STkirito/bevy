import 'dart:ui';

import 'package:awesonestyle/awesonestyle.dart';
import 'package:webview_flutter/webview_flutter.dart';

class _Define {
  RxInt loadingPercentage = 0.obs;
  RxString data = ''.obs;
  RxBool control = false.obs;
  late WebViewController controller;
}

class SearchOptionHomeController extends GetxController with _Define {
  search(String value) {
    control.value = true;

    String url = 'https://www.google.com/';

    String search = 'search?q=';

    if (value.isNotEmpty) {
      data.value = value.replaceAll(' ', '+');

      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
              loadingPercentage.value = progress;
            },
            onPageStarted: (String url) {
              loadingPercentage.value = 0;
            },
            onPageFinished: (String url) {
              loadingPercentage.value = 100;
            },
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }

              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse('$url$search${data.value}'));
    } else {
      control.value = false;
    }
  }
}
