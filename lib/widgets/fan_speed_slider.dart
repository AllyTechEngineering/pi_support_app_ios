import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/fan_speed_cubit/fan_speed_cubit.dart';
import '../bloc/fan_speed_cubit/fan_speed_state.dart';

class FanSpeedSlider extends StatelessWidget {
  const FanSpeedSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FanSpeedCubit, FanSpeedState>(
      builder: (context, fanState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Set Fan Speed: ${fanState.fanSpeed.toString()}%",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: fanState.fanSpeed.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              label: fanState.fanSpeed.toString(),
              onChanged: (newValue) {
                context.read<FanSpeedCubit>().updateFanSpeed(newValue.toInt());
              },
            ),
          ],
        );
      },
    );
  }
}
