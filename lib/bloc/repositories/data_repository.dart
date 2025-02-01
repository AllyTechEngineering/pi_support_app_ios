import 'dart:async';
import 'package:flutter/foundation.dart';

class DataRepository {
  static final DataRepository _instance = DataRepository._internal();

  factory DataRepository() {
    return _instance;
  }

  DataRepository._internal();

  final StreamController<Map<String, dynamic>> _controller = StreamController.broadcast();

  Stream<Map<String, dynamic>> get dataStream => _controller.stream;

  void updateData(Map<String, dynamic> updatedData) {
    _controller.add(updatedData);
    debugPrint("📡 Updated Data in Repository: $updatedData");
  }

  void dispose() {
    _controller.close();
  }
}
