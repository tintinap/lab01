import 'package:bloc/bloc.dart';
import 'counter_event.dart';


class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    
    switch (event) {
      case CounterEvent.decrease:
        yield currentState -1;
        break;
      case CounterEvent.increase:
        yield currentState +1;
        break;
    }
    // return null;
  }
}