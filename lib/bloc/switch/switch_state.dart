import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwich;
  final double slider;

  const SwitchState({this.isSwich = false, this.slider = 0.0});

  SwitchState copyWith({bool? isSwitchOn, double? mSlider}) {
    return SwitchState(isSwich: isSwitchOn ?? this.isSwich, slider: mSlider ?? this.slider);
  }

  @override
  List<Object?> get props => [isSwich, slider];
}
