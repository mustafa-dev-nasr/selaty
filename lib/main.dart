import 'package:flutter/material.dart';
import 'package:selaty/core/routing/app_router.dart';
import 'package:selaty/selaty_app.dart';

void main() {
  runApp( SelatyApp(appRouter: AppRouter(), isLoggedIn: false,));
}

