import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pi_app/bloc/repositories/data_repository.dart';
import 'data_in_state.dart';

class DataInCubit extends Cubit<DataInState> {
  final DataRepository dataRepository;
  late final StreamSubscription<Map<String, dynamic>> _dataSubscription;

  DataInCubit({required this.dataRepository}) : super(const DataInState()) {
    debugPrint("🟢 DataInCubit Constructor Called");
    _subscribeToDataStream();
  }

  void _subscribeToDataStream() {
    _dataSubscription = dataRepository.dataStream.listen((data) {
      debugPrint("🟢 DataInCubit: Received new data: $data");

      final newState = state.copyWith(
        setpointHumidity: data['setpointHumidity'],
        setpointTemperature: data['setpointTemperature'],
        currentTemperature: data['currentTemperature'],
        currentHumidity: data['currentHumidity'],
        fanSpeed: data['fanSpeed'],
        currentPressure: data['currentPressure'],
        systemOnOff: data['systemOnOff'],
        doughLevel: data['doughLevel'],
      );

      debugPrint("🔄 Emitting New State in DataInCubit: $newState");
      emit(newState);
    });
  }

  @override
  Future<void> close() {
    _dataSubscription.cancel();
    return super.close();
  }
}
