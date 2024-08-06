import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  //increment the counter
  void increment() => emit(state + 1);

  //decrement the counter
  void decrement() => emit(state - 1);
}
