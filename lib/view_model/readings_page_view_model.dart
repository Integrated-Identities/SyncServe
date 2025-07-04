import 'package:flutter/material.dart';
import 'package:syncserve/enums/battery_type.dart';

enum PhaseType { onePhase, threePhase }

class ReadingsViewModel {
  final powerController = TextEditingController();
  final dcVoltageController = TextEditingController();
  final energyController = TextEditingController();
  final manufacturerNameController = TextEditingController();

  bool withStabilizer = false;
  PhaseType inputPhase = PhaseType.onePhase;
  PhaseType outputPhase = PhaseType.onePhase;
  int quantity = 1;
  BatteryType batteryType = BatteryType.smf;

  void updateQuantity(int value) {
    quantity = value;
  }

  void toggleStabilizer(bool? value) {
    withStabilizer = value ?? false;
  }

  void reset() {
    powerController.clear();
    dcVoltageController.clear();
    energyController.clear();
    manufacturerNameController.clear();
    withStabilizer = false;
    inputPhase = PhaseType.onePhase;
    outputPhase = PhaseType.onePhase;
    quantity = 1;
    batteryType = BatteryType.smf;
  }

  void dispose() {
    powerController.dispose();
    dcVoltageController.dispose();
    energyController.dispose();
    manufacturerNameController.dispose();
  }
}
