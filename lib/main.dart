//Inte färdig kod, inte hunnit pga problem med ny dator. 
//Men tar gärna emot tips och tricks, tycker detta är svårt :)

import 'package:flutter/material.dart';
import 'package:template/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}