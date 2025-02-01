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
        title: const Text('Dough Proofer Control'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<DataInCubit, DataInState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDataTile('Temperature Set Point', state.temperatureSetPoint.toStringAsFixed(1)),
                _buildDataTile('Humidity Set Point', state.humiditySetPoint.toStringAsFixed(1)),
                _buildDataTile('Current Temperature', state.currentTemperature.toStringAsFixed(1)),
                _buildDataTile('Current Humidity', state.currentHumidity.toStringAsFixed(1)),
                _buildDataTile('Pressure', state.pressure.toStringAsFixed(1)),
                _buildDataTile('System On/Off', state.systemOnOff ? 'On' : 'Off'),
                _buildDataTile('Dough Level', state.doughLevel ? 'High' : 'Low'),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDataTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}