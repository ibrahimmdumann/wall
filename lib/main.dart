import 'package:davodeneme/pages/route_bloc.dart';
import 'package:davodeneme/pages/shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RouteBloc(),
        child: MaterialApp(
            title: 'Flutter ',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Shell()));
  }
}
