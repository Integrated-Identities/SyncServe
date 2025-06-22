enum BatteryType {
  smf,
  tub;

  String get name {
    switch (this) {
      case BatteryType.smf:
        return 'SMF';
      case BatteryType.tub:
        return 'TUB';
    }
  }
}
