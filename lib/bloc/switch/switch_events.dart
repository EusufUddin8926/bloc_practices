import 'package:flutter/material.dart';

abstract class SwitchEvent {
  SwitchEvent();
}

class EnableOrDisableNotification extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  double slider;
  SliderEvent({required this.slider});

  List<Object> get props => [slider];
}
