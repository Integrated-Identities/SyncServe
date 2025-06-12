enum ServiceReasons {
  installation,
  callBasis,
  preventiveMaintenance,
}

enum ServiceCategory { inWarranty, inFreeService, inAnnualMaintenanceContract }

enum ServiceSystemType {
  ups,
  generator,
  stabilizer,
  inverter,
  otherequipment,
}

extension ServiceReasonsFlag on ServiceReasons {
  int get bit {
    switch (this) {
      case ServiceReasons.installation:
        return 1 << 0;
      case ServiceReasons.callBasis:
        return 1 << 1;
      case ServiceReasons.preventiveMaintenance:
        return 1 << 2;
    }
  }
}

extension ServiceCategoryFlag on ServiceCategory {
  int get bit {
    switch (this) {
      case ServiceCategory.inWarranty:
        return 1 << 0;
      case ServiceCategory.inFreeService:
        return 1 << 1;
      case ServiceCategory.inAnnualMaintenanceContract:
        return 1 << 2;
    }
  }
}

extension ServiceSystemTypeFlag on ServiceSystemType {
  int get bit {
    switch (this) {
      case ServiceSystemType.ups:
        return 1 << 0;
      case ServiceSystemType.generator:
        return 1 << 1;
      case ServiceSystemType.stabilizer:
        return 1 << 2;
      case ServiceSystemType.inverter:
        return 1 << 3;
      case ServiceSystemType.otherequipment:
        return 1 << 4;
    }
  }
}
