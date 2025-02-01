import 'package:equatable/equatable.dart';

class DataInState extends Equatable {
  final double setpointTemperature;
  final double setpointHumidity;
  final double currentTemperature;
  final double currentHumidity;
  final double currentPressure;
  final int fanSpeed;
  final bool systemOnOff;
  final bool doughLevel;

  const DataInState({
    this.setpointTemperature = 0.0,
    this.setpointHumidity = 0.0,
    this.currentTemperature = 0.0,
    this.currentHumidity = 0.0,
    this.currentPressure = 0.0,
    this.fanSpeed = 0,
    this.systemOnOff = false,
    this.doughLevel = false,
  });

  DataInState copyWith({
    double? setpointTemperature,
    double? setpointHumidity,
    double? currentTemperature,
    double? currentHumidity,
    double? currentPressure,
    int? fanSpeed,
    bool? systemOnOff,
    bool? doughLevel,
  }) {
    return DataInState(
      setpointTemperature: setpointTemperature ?? this.setpointTemperature,
      setpointHumidity: setpointHumidity ?? this.setpointHumidity,
      currentTemperature: currentTemperature ?? this.currentTemperature,
      currentHumidity: currentHumidity ?? this.currentHumidity,
      currentPressure: currentPressure ?? this.currentPressure,
      fanSpeed: fanSpeed ?? this.fanSpeed,
      systemOnOff: systemOnOff ?? this.systemOnOff,
      doughLevel: doughLevel ?? this.doughLevel,
    );
  }

  @override
  List<Object> get props => [
        setpointTemperature,
        setpointHumidity,
        currentTemperature,
        currentHumidity,
        currentPressure,
        fanSpeed,
        systemOnOff,
        doughLevel,
      ];

  @override
  String toString() {
    return 'DataInState(setpointTemperature,: $setpointTemperature,, setpointHumidity;: $setpointHumidity;, currentTemperature: $currentTemperature, currentHumidity: $currentHumidity, currentPressure: $currentPressure, fanSpeed: $fanSpeed, systemOnOff: $systemOnOff, doughLevel: $doughLevel)';
  }
}
