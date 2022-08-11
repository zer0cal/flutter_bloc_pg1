import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pg1/blocs/counter_bloc.dart';

int count = 0;

class BlocConsumerExampleWidget extends StatelessWidget {
  const BlocConsumerExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('BlocConsumerExampleScreen', name: 'BUILD WIDGET');
    return Column(
      children: [
        Container(
          height: 40,
          color: Colors.blue.shade50,
          child: const Center(
            child: Text('BlocConsumer'),
          ),
        ),
        Row(
          children: const <Widget>[
            CountOfIncreasesOfCounterWidget(),
          ],
        ),
      ],
    );
  }
}

class CountOfIncreasesOfCounterWidget extends StatelessWidget {
  const CountOfIncreasesOfCounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('CountOfIncreasesOfCounterWidget', name: 'BUILD WIDGET');
    return BlocConsumer<CounterBloc, int>(
      listenWhen: (previous, current) => current > previous,
      listener: (context, state) {
        count++;
      },
      buildWhen: (previous, current) => current > previous,
      builder: (context, state) {
        dev.log('CountOfIncreasesOfCounterWidget', name: 'BUILD BLOC');
        return Container(
            color: Colors.amber.shade700,
            width: 120,
            height: 120,
            child: Center(
                child: Text(
              'increases of\ncounter: $count',
              softWrap: true,
              style: const TextStyle(color: Colors.white),
            )));
      },
    );
  }
}
