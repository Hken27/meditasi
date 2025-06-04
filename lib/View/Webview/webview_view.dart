import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GitHub extends StatefulWidget {
  const GitHub({Key? key}) : super(key: key);

  @override
  State<GitHub> createState() => _GitHubState();
}

class _GitHubState extends State<GitHub> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.instagram.com/tercipungcipung/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          // style:
          onPressed: () async {
            if (await _controller!.canGoBack()) {
              _controller!.goBack;
            } else {
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: WebViewWidget(controller: _controller!),
    );
  }
}
