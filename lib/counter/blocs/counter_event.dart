part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class Increment extends CounterEvent {}

final class Decrement extends CounterEvent {}
