import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pi_app/bloc/repositories/data_repository.dart';
import 'package:pi_app/services/html_service.dart';
import 'bloc/data_in_cubit/data_in_cubit.dart';
import 'screens/home_screen.dart';

void main() {
  final dataRepository = DataRepository();
  final httpService =
      HttpService(raspberryPiIp: '192.168.1.202'); // Replace with actual IP

  runApp(MyApp(
    dataRepository: dataRepository,
    httpService: httpService,
  ));
}

class MyApp extends StatelessWidget {
  final DataRepository dataRepository;
  final HttpService httpService;

  const MyApp(
      {super.key, required this.dataRepository, required this.httpService});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DataInCubit>(
          create: (context) => DataInCubit(dataRepository: dataRepository),
        ),
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
