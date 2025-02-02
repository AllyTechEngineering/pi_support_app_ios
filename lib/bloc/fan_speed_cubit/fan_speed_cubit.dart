import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pi_app/bloc/repositories/data_repository.dart';
import 'fan_speed_state.dart';

class FanSpeedCubit extends Cubit<FanSpeedState> {
  final DataRepository dataRepository;

  FanSpeedCubit({required this.dataRepository})
      : super(const FanSpeedState(fanSpeed: 0));

  void updateFanSpeed(int newSpeed) {
    emit(state.copyWith(fanSpeed: newSpeed));
    dataRepository.sendPiData({'fanSpeed': newSpeed});
  }
}
