import 'package:syncserve/interfaces/bit_flag.dart';

enum ServiceChecklistFlag implements BitFlag {
  batterycleaned(1 << 0),
  blowerchanged(1 << 1),
  upsConnectionTightened(1 << 2),
  batteryWaterLevelChecked(1 << 3),
  coolingFanWorks(1 << 4),
  backupChecked(1 << 5),
  staticBypassChecked(1 << 6),
  panelReadingMatched(1 << 7),
  historyCardEntered(1 << 8),
  equipmentIsOK(1 << 9);

  const ServiceChecklistFlag(this._value);

  final int _value;

  @override
  int get value => _value;
}
