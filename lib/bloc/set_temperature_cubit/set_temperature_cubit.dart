import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pi_app/bloc/repositories/data_repository.dart';
import 'set_temperature_state.dart';

class SetTemperatureCubit extends Cubit<SetTemperatureState> {
  final DataRepository dataRepository;

  SetTemperatureCubit({required this.dataRepository})
      : super(const SetTemperatureState(setpointTemperature: 0.0));

  void updateTemperature(double newTemperature) {
    emit(state.copyWith(setpointTemperature: newTemperature));
    dataRepository.sendPiData({'setpointTemperature': newTemperature});
  }
}
