import 'dart:async';

import 'package:bloc/bloc.dart';

part 'increment_event.dart';
part 'increment_state.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  IncrementBloc() : super(IncrementState(number: 0));

  @override
  Stream<IncrementState> mapEventToState(
    IncrementEvent event,
  ) async* {
    if (event is IncrementAdded) {
      yield IncrementState(number: state.number + 1);
    }
  }
}
