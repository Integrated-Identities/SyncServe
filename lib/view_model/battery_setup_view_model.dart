import 'package:flutter/material.dart';

class BatterySetupViewModel {
  // DC Voltage and Current Controllers
  final dcVoltageController = TextEditingController();
  final dcCurrentController = TextEditingController();

  // Battery After 40 mins Controllers
  final battVoltageController = TextEditingController();
  final battCurrentController = TextEditingController();

  // Input Voltage Controllers
  final inputNeutralController = TextEditingController();
  final inputEarthController = TextEditingController();

  // Output Voltage Controllers
  final outputNeutralController = TextEditingController();
  final outputEarthController = TextEditingController();

  // Frequency Controllers
  final inputFrequencyController = TextEditingController();
  final outputFrequencyController = TextEditingController();

  void reset() {
    dcVoltageController.clear();
    dcCurrentController.clear();
    battVoltageController.clear();
    battCurrentController.clear();
    inputNeutralController.clear();
    inputEarthController.clear();
    outputNeutralController.clear();
    outputEarthController.clear();
    inputFrequencyController.clear();
    outputFrequencyController.clear();
  }

  void dispose() {
    dcVoltageController.dispose();
    dcCurrentController.dispose();
    battVoltageController.dispose();
    battCurrentController.dispose();
    inputNeutralController.dispose();
    inputEarthController.dispose();
    outputNeutralController.dispose();
    outputEarthController.dispose();
    inputFrequencyController.dispose();
    outputFrequencyController.dispose();
  }
}
