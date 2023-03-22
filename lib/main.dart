import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/provider/browserProvider.dart';
import 'screen/view/bowserView.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BrowserProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {'/': (context) => Bowserscreen()},
      ),
    ),
  );
}
