import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pg1/screens/bloc_builder_example.dart';
import 'package:flutter_bloc_pg1/screens/bloc_selector_example.dart';
import 'package:flutter_bloc_pg1/blocs/counter_bloc.dart';
// import 'package:bloc/bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Bloc playground'),
          ),
          body: ListView(
            children: const [
              BlocBuilderExampleScreen(),
              BlocSelectorExampleScreen()
            ],
          ),
        ),
      ),
    );
  }
}
