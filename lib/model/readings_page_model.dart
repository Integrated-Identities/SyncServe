import 'package:syncserve/enums/battery_type.dart';
import 'package:syncserve/view_model/readings_page_view_model.dart';

class ReadingsPageModel {
  ReadingsPageModel({
    required this.power,
    required this.dcVoltage,
    required this.energy,
    required this.manufactureName,
    required this.withStabilizer,
    required this.quantity,
    required this.inputPhase,
    required this.outputPhase,
    required this.batteryType,
  });

  final String power;
  final BatteryType batteryType;
  final String dcVoltage;
  final String energy;
  final String manufactureName;
  final int quantity;
  final bool withStabilizer;
  final PhaseType inputPhase;
  final PhaseType outputPhase;
}
