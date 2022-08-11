import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pg1/blocs/counter_bloc.dart';

class BlocListenerExampleWidget extends StatelessWidget {
  const BlocListenerExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('BlocListenerExampleScreen', name: 'BUILD WIDGET');
    return Column(
      children: [
        Container(
          height: 40,
          color: Colors.blue.shade50,
          child: const Center(
            child: Text('BlocListener'),
          ),
        ),
        Row(
          children: const <Widget>[
            CountOfChangesToCounterWidget()
          ],
        ),
      ],
    );
  }
}

class CountOfChangesToCounterWidget extends StatefulWidget {
  const CountOfChangesToCounterWidget({Key? key}) : super(key: key);

  @override
  State<CountOfChangesToCounterWidget> createState() => _CountOfChangesToCounterWidgetState();
}

class _CountOfChangesToCounterWidgetState extends State<CountOfChangesToCounterWidget> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    dev.log('_CountOfChangesToCounterWidgetState', name: 'BUILD STATE');
    return BlocListener<CounterBloc, int>(
      listener: (context, state) {
        super.setState(() {
          count++;
        });
      },
      child: Container(
        color: Colors.indigo.shade700,
        width: 120,
        height: 120,
        child: Center(
            child: Text(
              'changes to\ncounter: $count',
              softWrap: true,
              style: const TextStyle(color: Colors.white),
            )))
    );
  }
}

