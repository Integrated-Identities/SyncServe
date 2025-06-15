enum PhaseType { onePhase, threePhase }

class ReadingsViewModel {
  String? kva;
  String? dcVoltage;
  String? ah;
  String? manufacturerName;
  bool withStabilizer = false;
  PhaseType inputPhase = PhaseType.onePhase;
  PhaseType outputPhase = PhaseType.onePhase;
  int quantity = 1;
  String? batteryType;

  void updateQuantity(int value) {
    quantity = value;
  }

  void toggleStabilizer(bool? value) {
    withStabilizer = value ?? false;
  }

  void reset() {
    kva = null;
    dcVoltage = null;
    ah = null;
    manufacturerName = null;
    withStabilizer = false;
    inputPhase = PhaseType.onePhase;
    outputPhase = PhaseType.onePhase;
    quantity = 1;
    batteryType = null;
  }
}
