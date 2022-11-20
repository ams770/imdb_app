import 'package:flutter/material.dart';
import 'package:imdb/app/di.dart';
import 'app/imdb_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();

  runApp(ImdbApp());
  
}
