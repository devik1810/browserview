import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BrowserProvider extends ChangeNotifier {
  double progressWeb = 0;
  InAppWebViewController? inAppWebViewController;

  void changeProgress(double rd) {
    progressWeb = rd;
    notifyListeners();
  }
}
