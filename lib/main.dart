///that's ninja api simple app
///that's root page;
library;

import 'package:flutter/material.dart';
import 'package:ninja_api/views/covid_page.dart';
import 'package:ninja_api/views/dns_page.dart';
import 'package:ninja_api/views/home_page.dart';
import 'package:ninja_api/views/telephone_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TelephonePage(
        country: 'country',
      ),
    );
  }
}
