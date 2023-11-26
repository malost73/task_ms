import 'package:equatable/equatable.dart';

abstract class ErrorEvent extends Equatable {
  const ErrorEvent();

  @override
  List<Object> get props => [];
}

class ShowToastEvent extends ErrorEvent {
  final String? message;

  const ShowToastEvent({this.message});

  @override
  List<Object> get props => [message ?? 0];
}
