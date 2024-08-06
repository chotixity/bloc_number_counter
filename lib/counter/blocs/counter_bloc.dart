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
    _initializeCounter();
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
    if (state.counterValue > 0) {
      currentCounter = state.counterValue - 1;
      await _firestore
          .collection(collectionName)
          .doc(docId)
          .set({'value': currentCounter});

      emit(CounterState(counterValue: currentCounter));
    }
  }

  Future<void> _initializeCounter() async {
    final doc = await _firestore.collection('counters').doc(docId).get();
    if (doc.exists) {
      emit(CounterState(counterValue: doc['value']));
    } else {
      await _firestore.collection('counters').doc(docId).set({'value': 0});
    }
  }
}
