import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pg1/blocs/counter_bloc.dart';

class BlocSelectorExampleWidget extends StatelessWidget {
  const BlocSelectorExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('BlocSelectorExampleWidget', name: 'BUILD WIDGET');
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
          children: const <Widget>[IsCounterOddWidget()],
        ),
      ],
    );
  }
}

class IsCounterOddWidget extends StatelessWidget {
  const IsCounterOddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('IsCounterOddWidget', name: 'BUILD WIDGET');
    return BlocSelector<CounterBloc, int, String>(
      selector: (state) => state.isOdd ? 'odd' : 'even',
      builder: (context, state) {
        dev.log('IsCounterOddWidget', name: 'BUILD BLOC');
        return Container(
            color: Colors.purpleAccent.shade700,
            width: 120,
            height: 120,
            child: Center(
                child: Text(
              'counter is $state',
              style: const TextStyle(color: Colors.white),
            )));
      },
    );
  }
}
