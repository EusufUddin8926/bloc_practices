import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();
}

class EnableOrDisableNotification extends SwitchEvent {
  @override
  List<Object?> get props => [];
}

class SliderEvent extends SwitchEvent {
  double slider;
  SliderEvent({required this.slider});

  List<Object> get props => [slider];
}
