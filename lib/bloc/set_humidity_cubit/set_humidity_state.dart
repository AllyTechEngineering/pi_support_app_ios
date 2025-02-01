import 'package:equatable/equatable.dart';

class SetHumidityState extends Equatable {
  final double setpointHumidity;

  const SetHumidityState({required this.setpointHumidity});

  SetHumidityState copyWith({double? setpointHumidity}) {
    return SetHumidityState(
      setpointHumidity: setpointHumidity ?? this.setpointHumidity,
    );
  }

  @override
  List<Object> get props => [setpointHumidity];

  @override
  String toString() {
    return 'SetHumidityState(setpointHumidity: $setpointHumidity)';
  }
}
