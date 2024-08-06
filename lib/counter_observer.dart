import 'package:bloc/bloc.dart';

class CounterObserver extends BlocObserver {
  CounterObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    //ignore: avoid_print
    print('${bloc.runtimeType} $change');
  }
}
