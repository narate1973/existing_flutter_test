import 'dart:async';

import 'package:bloc/bloc.dart';

part 'increment2_event.dart';
part 'increment2_state.dart';

class Increment2Bloc extends Bloc<Increment2Event, Increment2State> {
  Increment2Bloc() : super(Increment2State(number: 0));

  @override
  Stream<Increment2State> mapEventToState(
    Increment2Event event,
  ) async* {
    if (event is Increment2Added) {
      yield Increment2State(number: state.number + 1);
    }
  }
}
