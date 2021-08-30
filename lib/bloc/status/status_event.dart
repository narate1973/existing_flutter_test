part of 'status_bloc.dart';

abstract class StatusEvent {
  const StatusEvent();
}

class StatusToSuccess extends StatusEvent {}

class StatusToFailed extends StatusEvent {}
