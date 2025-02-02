import 'package:equatable/equatable.dart';

class FanSpeedState extends Equatable {
  final int fanSpeed;

  const FanSpeedState({required this.fanSpeed});

  FanSpeedState copyWith({int? fanSpeed}) {
    return FanSpeedState(
      fanSpeed: fanSpeed ?? this.fanSpeed,
    );
  }

  @override
  List<Object> get props => [fanSpeed];

  @override
  String toString() {
    return 'FanSpeedState(fanSpeed: $fanSpeed)';
  }
}
