import 'package:flutter/material.dart';

import 'Homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Qr Scanner App",
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
