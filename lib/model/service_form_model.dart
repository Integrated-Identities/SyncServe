class ServiceFormModel {
  String? manufacturerName;
  bool isInstallationSelected = false;
  bool isCallBasisSelected = false;
  bool isPreventiveMaintenanceSelected = false;
  bool isInWarrantySelected = false;
  bool isInFreeServiceSelected = false;
  bool isInAnnualSelected = false;
  bool isInUPSSelected = false;
  bool isInGeneratorSelected = false;
  bool isInStabilizerSelected = false;
  bool isInInverterSelected = false;
  bool isManufacturerTouched = false;

  bool get isAtLeastOneReasonSelected =>
      isInstallationSelected ||
      isCallBasisSelected ||
      isPreventiveMaintenanceSelected;

  bool get isAtLeastOneServiceCategorySelected =>
      isInWarrantySelected || isInFreeServiceSelected || isInAnnualSelected;

  bool get isAtLeastOneSystemTypeSelected =>
      isInUPSSelected ||
      isInGeneratorSelected ||
      isInStabilizerSelected ||
      isInInverterSelected;

  bool get isManufacturerValid =>
      manufacturerName != null && manufacturerName!.trim().isNotEmpty;

  bool isValid() {
    return isManufacturerValid &&
        isAtLeastOneReasonSelected &&
        isAtLeastOneServiceCategorySelected &&
        isAtLeastOneSystemTypeSelected;
  }
}
