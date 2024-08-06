import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

import 'package:fun_bloc/counter_observer.dart';
import 'package:fun_bloc/firebase_options.dart';
import 'app.dart';

void main() async {
  Bloc.observer = CounterObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const CounterApp());
}
