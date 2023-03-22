import 'package:browserview/screen/provider/browserProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class Bowserscreen extends StatefulWidget {
  const Bowserscreen({Key? key}) : super(key: key);

  @override
  State<Bowserscreen> createState() => _BowserscreenState();
}

class _BowserscreenState extends State<Bowserscreen> {
  TextEditingController txtSearch = TextEditingController();
  BrowserProvider? browserProviderT;
  BrowserProvider? browserProviderF;

  @override
  Widget build(BuildContext context) {
    browserProviderT = Provider.of<BrowserProvider>(context, listen: true);
    browserProviderF = Provider.of<BrowserProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        browserProviderT!.inAppWebViewController!.goBack();
                      },
                      icon: Icon(Icons.arrow_back)),
                  IconButton(
                      onPressed: () {
                        browserProviderT!.inAppWebViewController!.reload();
                      },
                      icon: Icon(Icons.refresh)),
                  Expanded(
                    child: TextField(
                      controller: txtSearch,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {
                            var newLink = txtSearch.text;

                            browserProviderT!.inAppWebViewController!.loadUrl(
                                urlRequest: URLRequest(
                                    url: Uri.parse(
                                        "https://www.google.com/search?q=$newLink")));
                          },
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        browserProviderT!.inAppWebViewController!.goForward();
                      },
                      icon: Icon(Icons.arrow_forward)),
                ],
              ),
            ),
            LinearProgressIndicator(value: browserProviderT!.progressWeb),
            Expanded(
                child: InAppWebView(
              initialUrlRequest:
                  URLRequest(url: Uri.parse("https://www.google.com/")),
              onWebViewCreated: (controller) {
                browserProviderT!.inAppWebViewController = controller;
              },
              onLoadError: (controller, url, code, message) {
                browserProviderT!.inAppWebViewController = controller;
              },
              onLoadStart: (controller, url) {
                browserProviderT!.inAppWebViewController = controller;
              },
              onLoadStop: (controller, url) {
                browserProviderT!.inAppWebViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                browserProviderF!.changeProgress(progress / 100);
              },
            ))
          ],
        ),
      ),
    );
  }
}
