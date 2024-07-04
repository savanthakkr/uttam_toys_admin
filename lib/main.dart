import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uttam_toys/environment.dart';
import 'package:uttam_toys/root_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();



  Environment.init(
    apiBaseUrl: 'https://example.com',
  );

  runApp(const RootApp());
}
