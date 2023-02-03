import 'package:flutter/material.dart';
import 'package:masterminds/SignIn.dart';

void main() {
  runApp( MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signin',
      routes: {
        '/signin' : (context) => const SignIn(),
      }));
}