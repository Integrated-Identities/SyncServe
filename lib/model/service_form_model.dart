class ServiceFormModel {
  // Form data
  String? manufacturerName;
  bool isManufacturerTouched = false;

  // Reason for Visit selections
  bool isInstallationSelected = false;
  bool isCallBasisSelected = false;
  bool isPreventiveMaintenanceSelected = false;

  // Service Category selections
  bool isInWarrantySelected = false;
  bool isInFreeServiceSelected = false;
  bool isInAnnualSelected = false;

  // System Type selections
  bool isInUPSSelected = false;
  bool isInGeneratorSelected = false;
  bool isInStabilizerSelected = false;
  bool isInInverterSelected = false;

  // Section validations
  bool get isAtLeastOneReasonSelected =>
      isInstallationSelected ||
      isCallBasisSelected ||
      isPreventiveMaintenanceSelected;

  bool get isAtLeastOneCategorySelected =>
      isInWarrantySelected || isInFreeServiceSelected || isInAnnualSelected;

  bool get isAtLeastOneSystemTypeSelected =>
      isInUPSSelected ||
      isInGeneratorSelected ||
      isInStabilizerSelected ||
      isInInverterSelected;

  bool get isManufacturerValid =>
      manufacturerName != null && manufacturerName!.trim().isNotEmpty;

  // Form validation
  bool get isValid =>
      isManufacturerValid &&
      isAtLeastOneReasonSelected &&
      isAtLeastOneCategorySelected &&
      isAtLeastOneSystemTypeSelected;
}
