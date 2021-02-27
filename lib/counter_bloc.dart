import 'dart:async';
import 'package:bloc/bloc.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<EventCounter, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0));

  @override
  Stream<CounterState> mapEventToState(
    EventCounter event,
  ) async* {
    switch (event) {
      case EventCounter.increment:
        yield CounterState(counterValue: state.counterValue + 1);
        break;
      case EventCounter.decremnet:
        yield CounterState(counterValue: state.counterValue - 1);
    }
    // TODO: implement mapEventToState
  }
}
