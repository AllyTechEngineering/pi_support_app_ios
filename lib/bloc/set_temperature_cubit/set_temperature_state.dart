import 'package:equatable/equatable.dart';

class SetTemperatureState extends Equatable {
  final double setpointTemperature;

  const SetTemperatureState({required this.setpointTemperature});

  SetTemperatureState copyWith({double? setpointTemperature}) {
    return SetTemperatureState(
      setpointTemperature: setpointTemperature ?? this.setpointTemperature,
    );
  }

  @override
  List<Object> get props => [setpointTemperature];

  @override
  String toString() {
    return 'SetTemperatureState(setpointTemperature: $setpointTemperature)';
  }
}
