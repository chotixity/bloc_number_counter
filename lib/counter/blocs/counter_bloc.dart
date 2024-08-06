import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part './counter_event.dart';
part './counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int currentCounter = 0;
  String docId = 'chotiCounter';
  String collectionName = 'counters';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CounterBloc() : super(const CounterState(counterValue: 0)) {
    on<Increment>(_increment);
    on<Decrement>(_decrement);
  }

  void _increment(Increment event, Emitter<CounterState> emit) async {
    currentCounter = state.counterValue + 1;
    await _firestore
        .collection(collectionName)
        .doc(docId)
        .set({'value': currentCounter});
    emit(CounterState(counterValue: currentCounter));
  }

  void _decrement(Decrement event, Emitter<CounterState> emit) async {
    currentCounter = state.counterValue - 1;
    await _firestore
        .collection(collectionName)
        .doc(docId)
        .set({'value': currentCounter});
    emit(CounterState(counterValue: currentCounter));
  }
}
