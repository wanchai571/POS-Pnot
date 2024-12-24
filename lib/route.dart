import 'package:flutter/material.dart';
import 'package:pos/presentation/detailItemScan.dart';
import 'package:pos/presentation/disposeItem.dart';
import 'package:pos/presentation/home.dart';
import 'package:pos/presentation/login.dart';
import 'package:pos/presentation/scanList.dart';
import 'package:pos/presentation/splash.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/splash':
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return SplashPage();
        },
      );
    case '/login':
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return LoginPage();
        },
      );
    case '/home':
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return HomePage();
        },
      );
    case '/scanList':
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return ScanListPage();
        },
      );
    case '/detailItemScan':
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return DetailScanItemPage();
        },
      );
    case '/disposeItem':
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return DisposeItemPage();
        },
      );
  }
  return null;
}
