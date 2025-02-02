import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pi_app/bloc/fan_speed_cubit/fan_speed_cubit.dart';
import 'package:pi_app/bloc/repositories/data_repository.dart';
import 'package:pi_app/bloc/set_humidity_cubit/set_humidity_cubit.dart';
import 'package:pi_app/bloc/set_temperature_cubit/set_temperature_cubit.dart';
import 'package:pi_app/bloc/system_on_off_cubit/system_on_off_cubit.dart';
import 'services/http_service.dart';
import 'bloc/data_in_cubit/data_in_cubit.dart';
import 'screens/home_screen.dart';

void main() {
  final httpService =
      HttpService(raspberryPiIp: '192.168.1.202'); // Ensure correct Pi IP
  final dataRepository =
      DataRepository(httpService: httpService); // ✅ Use DataRepository

  debugPrint(
      "🚀 Starting MyApp with Raspberry Pi at ${httpService.raspberryPiIp}");

  runApp(MyApp(dataRepository: dataRepository));
}

class MyApp extends StatelessWidget {
  final DataRepository dataRepository;

  const MyApp({super.key, required this.dataRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DataInCubit>(
          create: (context) => DataInCubit(
              dataRepository: dataRepository), // ✅ Inject DataRepository
        ),
        BlocProvider<SetTemperatureCubit>(
          create: (context) => SetTemperatureCubit(
              dataRepository: dataRepository), // ✅ Added SetTemperatureCubit
        ),
        BlocProvider<SetHumidityCubit>(
            create: (context) => SetHumidityCubit(
                dataRepository: dataRepository)), // ✅ Added SetHumidityCubit
        BlocProvider<SystemOnOffCubit>(
            create: (context) => SystemOnOffCubit(
                dataRepository: dataRepository)), // ✅ Added SystemOnOffCubit
        BlocProvider<FanSpeedCubit>(
            create: (context) => FanSpeedCubit(
                dataRepository: dataRepository)), // ✅ Added FanSpeedCubit
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dough Proofer Control',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
