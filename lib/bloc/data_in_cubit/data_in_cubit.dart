import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pi_app/bloc/repositories/data_repository.dart';
import 'package:pi_app/services/html_service.dart';
import 'data_in_state.dart';

class DataInCubit extends Cubit<DataInState> {
  final DataRepository dataRepository;

  DataInCubit({required this.dataRepository}) : super(const DataInState()) {
    _subscribeToDataStream();
  }

  void _subscribeToDataStream() {
    dataRepository.dataStream.listen((data) {
      emit(state.copyWith(
        temperatureSetPoint: data['temperatureSetPoint'] ?? state.temperatureSetPoint,
        humiditySetPoint: data['humiditySetPoint'] ?? state.humiditySetPoint,
        currentTemperature: data['currentTemperature'] ?? state.currentTemperature,
        currentHumidity: data['currentHumidity'] ?? state.currentHumidity,
        pressure: data['pressure'] ?? state.pressure,
        systemOnOff: data['systemOnOff'] ?? state.systemOnOff,
        doughLevel: data['doughLevel'] ?? state.doughLevel,
      ));
    });
  }
}
