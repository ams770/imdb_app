import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdb/app/di.dart';
import 'app/imdb_app.dart';
import 'dart:io' show Platform;
Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  if(Platform.isIOS){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  }

  await initAppModule();
  

  runApp(ImdbApp());
  
}
