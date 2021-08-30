part of 'status_bloc.dart';

class StatusState extends Equatable {
  final bool isSuccess;
  const StatusState({required this.isSuccess});

  @override
  List<Object> get props => [isSuccess];
}
