import 'package:syncserve/interfaces/bit_flag.dart';

/// Enum representing various reasons for a service.
enum ServiceReasons implements BitFlag {
  installation(1 << 0),
  callBasis(1 << 1),
  preventiveMaintenance(1 << 2);

  const ServiceReasons(this.value);

  @override
  final int value;
}

/// Enum representing different categories of service.
enum ServiceCategory implements BitFlag {
  inWarranty(1 << 0),
  inFreeService(1 << 1),
  inAnnualMaintenanceContract(1 << 2);

  const ServiceCategory(this.value);

  @override
  final int value;
}

/// Enum representing different types of service systems.
enum ServiceSystemType implements BitFlag {
  ups(1 << 0),
  generator(1 << 1),
  stabilizer(1 << 2),
  inverter(1 << 3),
  otherEquipment(1 << 4);

  const ServiceSystemType(this.value);

  @override
  final int value;
}
