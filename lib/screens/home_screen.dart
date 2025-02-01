import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/data_in_cubit/data_in_cubit.dart';
import '../bloc/data_in_cubit/data_in_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dough Proofer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<DataInCubit, DataInState>(
          builder: (context, state) {
            debugPrint("🎨 UI Rebuilding with State: $state");
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDataTile('Temperature Set Point',
                    state.setpointTemperature.toStringAsFixed(0), '°C'),
                _buildDataTile('Humidity Set Point',
                    state.setpointHumidity.toStringAsFixed(0), '°C'),
                _buildDataTile('Current Temperature',
                    state.currentTemperature.toStringAsFixed(2), '°C'),
                _buildDataTile('Current Humidity',
                    state.currentHumidity.toStringAsFixed(2), '%'),
                _buildDataTile(
                    'Pressure', state.currentPressure.toStringAsFixed(2), 'Pa'),
                _buildDataTile('Fan Speed', state.fanSpeed.toString(), '%'),
                _buildDataTile(
                    'System On/Off', state.systemOnOff ? 'On' : 'Off', ''),
                _buildDataTile('Dough Level',
                    state.doughLevel ? 'Risen' : 'Still Rising', ''),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDataTile(String title, String value, String unit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontSize: 18)),
          Text(unit, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
