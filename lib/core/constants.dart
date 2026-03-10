import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';

int mainLayoutIntitalScreenIndex = 0;

String? userToken;
final navigatorKey = GlobalKey<NavigatorState>();
final Debouncer debouncer = Debouncer();
bool? isAdmin;
