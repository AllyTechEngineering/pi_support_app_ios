import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pi_app/bloc/set_humidity_cubit/set_humidity_cubit.dart';
import 'package:pi_app/bloc/set_humidity_cubit/set_humidity_state.dart';

class _HumiditySlider extends StatelessWidget {
  const _HumiditySlider();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetHumidityCubit, SetHumidityState>(
      builder: (context, humidityState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Set Humidity: ${humidityState.setpointHumidity.toStringAsFixed(1)} %",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: humidityState.setpointHumidity,
              min: 0,
              max: 100,
              divisions: 100,
              label: humidityState.setpointHumidity.toStringAsFixed(1),
              onChanged: (newValue) {
                context.read<SetHumidityCubit>().updateHumidity(newValue);
              },
            ),
          ],
        );
      },
    );
  }
}
