import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';

int mainLayoutIntitalScreenIndex = 0;

String? userToken;
final navigatorKey = GlobalKey<NavigatorState>();
final Debouncer debouncer = Debouncer();
bool? isAdmin;

final List<String> row1Images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
  ];

  final List<String> row2Images = [
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
  ];