import 'package:bloc/bloc.dart';
import 'package:counter_bloc/bloc/switch/switch_events.dart';
import 'package:counter_bloc/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(SwitchEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitchOn: !state.isSwich));
  }

  void _slider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(mSlider: event.slider));
  }
}
