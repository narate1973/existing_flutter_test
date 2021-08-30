import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'status_event.dart';
part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  StatusBloc() : super(StatusState(isSuccess: true));

  @override
  Stream<StatusState> mapEventToState(
    StatusEvent event,
  ) async* {
    if (event is StatusToSuccess) {
      yield StatusState(isSuccess: true);
    }
    if (event is StatusToFailed) {
      yield StatusState(isSuccess: false);
    }
  }
}
