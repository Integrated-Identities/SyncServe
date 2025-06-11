import 'package:flutter/material.dart';

class ServiceFormViewModel {
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

  final TextEditingController manufacturerController = TextEditingController();
  bool isManufacturerTouched = false;

  void setInstallationSelected(bool? value) {
    isInstallationSelected = value ?? false;
  }

  void setCallBasisSelected(bool? value) {
    isCallBasisSelected = value ?? false;
  }

  void setPreventiveMaintenanceSelected(bool? value) {
    isPreventiveMaintenanceSelected = value ?? false;
  }

  void setInWarrantySelected(bool? value) {
    isInWarrantySelected = value ?? false;
  }

  void setInFreeServiceSelected(bool? value) {
    isInFreeServiceSelected = value ?? false;
  }

  void setInAnnualSelected(bool? value) {
    isInAnnualSelected = value ?? false;
  }

  void setInUPSSelected(bool? value) {
    isInUPSSelected = value ?? false;
  }

  void setInGeneratorSelected(bool? value) {
    isInGeneratorSelected = value ?? false;
  }

  void setInStabilizerSelected(bool? value) {
    isInStabilizerSelected = value ?? false;
  }

  void setInInverterSelected(bool? value) {
    isInInverterSelected = value ?? false;
  }

  void updateManufacturerName(String value) {
    isManufacturerTouched = true;
  }
}
