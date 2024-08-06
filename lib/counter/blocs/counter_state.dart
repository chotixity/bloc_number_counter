part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;

  const CounterState({required this.counterValue});

  @override
  List<Object?> get props => [counterValue];
}
