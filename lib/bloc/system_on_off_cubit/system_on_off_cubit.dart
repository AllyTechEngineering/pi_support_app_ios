import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pi_app/bloc/repositories/data_repository.dart';
import 'system_on_off_state.dart';

class SystemOnOffCubit extends Cubit<SystemOnOffState> {
  final DataRepository dataRepository;

  SystemOnOffCubit({required this.dataRepository})
      : super(const SystemOnOffState(systemOnOff: false));

  void toggleSystem(bool isOn) {
    emit(state.copyWith(systemOnOff: isOn));
    dataRepository.sendPiData({'systemOnOff': isOn});
  }
}
