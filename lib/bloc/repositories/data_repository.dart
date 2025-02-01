import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:pi_app/services/http_service.dart';


class DataRepository {
  final HttpService httpService;
  final StreamController<Map<String, dynamic>> _dataStreamController = StreamController.broadcast();
  Timer? _timer;

  DataRepository({required this.httpService}) {
    startFetchingData();
  }

  void startFetchingData() {
    fetchDataFromPi(); // Fetch once immediately

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      await fetchDataFromPi();
    });
  }

  Future<void> fetchDataFromPi() async {
    debugPrint("📡 DataRepository: Fetching data from Pi");
    try {
      final data = await httpService.fetchData();
      if (data != null) {
        debugPrint("📡 DataRepository: Received data from Pi: $data");
        _dataStreamController.add(data); // Push new data to stream
      }
    } catch (e) {
      debugPrint("❌ DataRepository: Error fetching data: $e");
    }
  }

  Stream<Map<String, dynamic>> get dataStream => _dataStreamController.stream;

  Future<bool> sendPiData(Map<String, dynamic> updatedData) async {
    debugPrint("📡 DataRepository: Sending data to Pi: $updatedData");
    return await httpService.sendData(updatedData);
  }

  void dispose() {
    _timer?.cancel();
    _dataStreamController.close();
  }
}

