import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'initial_event.dart';
part 'initial_state.dart';
class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc() : super(InitialInitial());
  @override
  Stream<InitialState> mapEventToState(
    InitialEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
