import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pi_app/bloc/set_temperature_cubit/set_temperature_cubit.dart';
import 'package:pi_app/bloc/set_temperature_cubit/set_temperature_state.dart';

class _TemperatureSlider extends StatelessWidget {
  const _TemperatureSlider();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetTemperatureCubit, SetTemperatureState>(
      builder: (context, tempState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Set Temperature: ${tempState.setpointTemperature.toStringAsFixed(1)} °C",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: tempState.setpointTemperature,
              min: 0,
              max: 100,
              divisions: 100,
              label: tempState.setpointTemperature.toStringAsFixed(1),
              onChanged: (newValue) {
                context.read<SetTemperatureCubit>().updateTemperature(newValue);
              },
            ),
          ],
        );
      },
    );
  }
}
