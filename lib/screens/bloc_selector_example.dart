import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pg1/blocs/counter_bloc.dart';

class BlocSelectorExampleScreen extends StatelessWidget {
  const BlocSelectorExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('BlocSelectorExampleScreen', name: 'BUILD');
    return Column(
      children: [
        Container(
          height: 40,
          color: Colors.blue.shade50,
          child: const Center(
            child: Text('BlocSelector'),
          ),
        ),
        Row(
          children: const <Widget>[IsCounterOddView()],
        ),
      ],
    );
  }
}

class IsCounterOddView extends StatelessWidget {
  const IsCounterOddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CounterBloc, int, String>(
      selector: (state) => state.isOdd ? 'odd' : 'even',
      builder: (context, state) {
        return Container(
            color: Colors.purpleAccent.shade700,
            width: 120,
            height: 120,
            child: Center(
                child: Text(
              'Counter is $state',
              style: const TextStyle(color: Colors.white),
            )));
      },
    );
  }
}
