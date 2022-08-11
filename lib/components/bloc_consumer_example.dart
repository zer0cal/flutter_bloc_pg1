import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pg1/blocs/counter_bloc.dart';

int countOfIncreases = 0;
int countOfDecreases = 0;

class BlocConsumerExampleWidget extends StatelessWidget {
  const BlocConsumerExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('BlocConsumerExampleWidget', name: 'BUILD WIDGET');
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
            CountOfDecreasesOfCounterWidget(),
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
        countOfIncreases++;
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
              'increases of'
              '\ncounter: $countOfIncreases',
              softWrap: true,
              style: const TextStyle(color: Colors.white),
            )));
      },
    );
  }
}

class CountOfDecreasesOfCounterWidget extends StatelessWidget {
  const CountOfDecreasesOfCounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('CountOfDecreasesOfCounterWidget', name: 'BUILD WIDGET');
    return BlocConsumer<CounterBloc, int>(
      listenWhen: (previous, current) => current < previous,
      listener: (context, state) {
        countOfDecreases++;
      },
      buildWhen: (previous, current) => current < previous,
      builder: (context, state) {
        dev.log('CountOfDecreasesOfCounterWidget', name: 'BUILD BLOC');
        return Container(
            color: Colors.green.shade700,
            width: 120,
            height: 120,
            child: Center(
                child: Text(
              'increases of\n'
              'counter: $countOfDecreases',
              softWrap: true,
              style: const TextStyle(color: Colors.white),
            )));
      },
    );
  }
}
