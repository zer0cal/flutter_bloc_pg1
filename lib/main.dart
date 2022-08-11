import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pg1/components//bloc_builder_example.dart';
import 'package:flutter_bloc_pg1/components//bloc_selector_example.dart';
import 'package:flutter_bloc_pg1/blocs/counter_bloc.dart';
import 'package:flutter_bloc_pg1/components/bloc_consumer_example.dart';
import 'package:flutter_bloc_pg1/components/bloc_listener_example.dart';
// import 'package:bloc/bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('MainApp', name: 'BUILD WIDGET');
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('flutter_bloc playground'),
          ),
          body: ListView(
            children: const <Widget>[
              BlocBuilderExampleWidget(),
              BlocSelectorExampleWidget(),
              BlocListenerExampleWidget(),
              BlocConsumerExampleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
