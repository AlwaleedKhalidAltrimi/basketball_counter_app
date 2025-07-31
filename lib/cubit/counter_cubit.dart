import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int teamAPointer = 0;
  int teamBPointer = 0;

  CounterCubit() : super(CounterInitialState());

  void teamIncrement({required String team, required int points}) {
    if (team == 'A') {
      teamAPointer += points;
      emit(CounterAIncrementState());
    } else {
      teamBPointer += points;
      emit(CounterBIncrementState());
    }
  }

  void reset() {
    teamAPointer = 0;
    teamBPointer = 0;
    emit(CounterResetState());
  }
}
