import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/enums/battery_type.dart';
import 'package:syncserve/model/readings_page_model.dart';
import 'package:syncserve/providers/readings_page_providers.dart';

enum PhaseType { onePhase, threePhase }

class ReadingsViewModel {
  void save(WidgetRef ref) {
    final model = ReadingsPageModel(
      power: powerController.text.trim(),
      dcVoltage: dcVoltageController.text.trim(),
      energy: energyController.text.trim(),
      manufactureName: manufacturerNameController.text.trim(),
      withStabilizer: withStabilizer,
      quantity: quantity,
      inputPhase: inputPhase,
      outputPhase: outputPhase,
      batteryType: batteryType,
    );
    ref.read(readingsPageProvider.notifier).state = model;
  }

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
