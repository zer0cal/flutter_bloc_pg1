import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pg1/blocs/counter_bloc.dart';

class BlocBuilderExampleScreen extends StatelessWidget {
  const BlocBuilderExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('BlocBuilderExampleScreen', name: 'BUILD');
    return Column(
      children: [
        Container(
          height: 40,
          color: Colors.blue.shade50,
          child: const Center(
            child: Text('BlocBuilder'),
          ),
        ),
        Row(
          children: const [
            IncrementButton(),
            DecrementButton(),
            CounterWidget(),
          ],
        ),
      ],
    );
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('IncrementButton', name: 'BUILD');
    return Container(
      color: Colors.greenAccent.shade700,
      width: 120,
      height: 120,
      child: TextButton(
        onPressed: () {
          context.read<CounterBloc>().add(CounterIncrementPressed());
        },
        child: const Text(
          'increment',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class DecrementButton extends StatelessWidget {
  const DecrementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('DecrementButton', name: 'BUILD');
    return Container(
      color: Colors.redAccent.shade700,
      width: 120,
      height: 120,
      child: TextButton(
        onPressed: () {
          context.read<CounterBloc>().add(CounterDecrementPressed());
        },
        child: const Text(
          'decrement',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('CounterWidget', name: 'BUILD');
    return BlocBuilder<CounterBloc, int>(builder: (context, state) {
      return Container(
        color: Colors.yellow.shade700,
        width: 120,
        height: 120,
        child: Center(
          child: Text(
            context.read<CounterBloc>().state.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }
}
