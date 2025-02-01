import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/data_repository.dart';
import 'set_humidity_state.dart';

class SetHumidityCubit extends Cubit<SetHumidityState> {
  final DataRepository dataRepository;

  SetHumidityCubit({required this.dataRepository})
      : super(const SetHumidityState(setpointHumidity: 0.0));

  void updateHumidity(double newHumidity) {
    emit(state.copyWith(setpointHumidity: newHumidity));
    dataRepository.sendPiData({'setpointHumidity': newHumidity});
  }
}
