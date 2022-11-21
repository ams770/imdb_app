import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/app/di.dart';
import 'package:imdb/domain/usecases/get_top_250_usecase.dart';
import 'package:imdb/presentation/layout/base_cubit/base_cubit.dart';

import '../presentation/layout/view/layout_view.dart';

class ImdbApp extends StatefulWidget {
  // ignore: empty_constructor_bodies
  ImdbApp._internal() {}

  static final ImdbApp _instance = ImdbApp._internal();

  factory ImdbApp() => _instance;

  @override
  State<ImdbApp> createState() => _ImdbAppState();
}

class _ImdbAppState extends State<ImdbApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutView(),
    );
  }
}
