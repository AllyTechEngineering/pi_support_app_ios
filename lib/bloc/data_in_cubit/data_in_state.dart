import 'package:equatable/equatable.dart';

class DataInState extends Equatable {
  final double temperatureSetPoint;
  final double humiditySetPoint;
  final double currentTemperature;
  final double currentHumidity;
  final double pressure;
  final bool systemOnOff;
  final bool doughLevel;

  const DataInState({
    this.temperatureSetPoint = 0.0,
    this.humiditySetPoint = 0.0,
    this.currentTemperature = 0.0,
    this.currentHumidity = 0.0,
    this.pressure = 0.0,
    this.systemOnOff = false,
    this.doughLevel = false,
  });

  DataInState copyWith({
    double? temperatureSetPoint,
    double? humiditySetPoint,
    double? currentTemperature,
    double? currentHumidity,
    double? pressure,
    bool? systemOnOff,
    bool? doughLevel,
  }) {
    return DataInState(
      temperatureSetPoint: temperatureSetPoint ?? this.temperatureSetPoint,
      humiditySetPoint: humiditySetPoint ?? this.humiditySetPoint,
      currentTemperature: currentTemperature ?? this.currentTemperature,
      currentHumidity: currentHumidity ?? this.currentHumidity,
      pressure: pressure ?? this.pressure,
      systemOnOff: systemOnOff ?? this.systemOnOff,
      doughLevel: doughLevel ?? this.doughLevel,
    );
  }

  @override
  List<Object> get props => [
    temperatureSetPoint,
    humiditySetPoint,
    currentTemperature,
    currentHumidity,
    pressure,
    systemOnOff,
    doughLevel,
  ];

  @override
  String toString() {
    return 'DataInState(temperatureSetPoint: $temperatureSetPoint, humiditySetPoint: $humiditySetPoint, currentTemperature: $currentTemperature, currentHumidity: $currentHumidity, pressure: $pressure, systemOnOff: $systemOnOff, doughLevel: $doughLevel)';
  }
}
