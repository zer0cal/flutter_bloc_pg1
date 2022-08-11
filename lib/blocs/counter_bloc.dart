import 'dart:async';
import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    dev.log(transition.toString(), name: 'EVENT');
    super.onTransition(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    dev.log('CounterBloc.onError', error: error, stackTrace: stackTrace, name: 'ERROR');
    super.onError(error, stackTrace);
  }
}
