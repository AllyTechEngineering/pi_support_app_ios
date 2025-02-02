import 'package:equatable/equatable.dart';

class SystemOnOffState extends Equatable {
  final bool systemOnOff;

  const SystemOnOffState({required this.systemOnOff});

  SystemOnOffState copyWith({bool? systemOnOff}) {
    return SystemOnOffState(
      systemOnOff: systemOnOff ?? this.systemOnOff,
    );
  }

  @override
  List<Object> get props => [systemOnOff];

  @override
  String toString() {
    return 'SystemOnOffState(systemOnOff: $systemOnOff)';
  }
}
