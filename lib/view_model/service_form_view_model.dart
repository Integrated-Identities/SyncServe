import 'package:flutter/material.dart';
import 'package:syncserve/model/service_form_model.dart';

class ServiceFormViewModel {
  final _model = ServiceFormModel();
  final TextEditingController manufacturerController = TextEditingController();

  // Forward model properties
  bool get isInstallationSelected => _model.isInstallationSelected;
  bool get isCallBasisSelected => _model.isCallBasisSelected;
  bool get isPreventiveMaintenanceSelected =>
      _model.isPreventiveMaintenanceSelected;
  bool get isInWarrantySelected => _model.isInWarrantySelected;
  bool get isInFreeServiceSelected => _model.isInFreeServiceSelected;
  bool get isInAnnualSelected => _model.isInAnnualSelected;
  bool get isInUPSSelected => _model.isInUPSSelected;
  bool get isInGeneratorSelected => _model.isInGeneratorSelected;
  bool get isInStabilizerSelected => _model.isInStabilizerSelected;
  bool get isInInverterSelected => _model.isInInverterSelected;
  bool get isManufacturerTouched => _model.isManufacturerTouched;

  // Forward validations
  bool get isAtLeastOneReasonSelected => _model.isAtLeastOneReasonSelected;
  bool get isAtLeastOneCategorySelected => _model.isAtLeastOneCategorySelected;
  bool get isAtLeastOneSystemTypeSelected =>
      _model.isAtLeastOneSystemTypeSelected;
  bool get isManufacturerValid => _model.isManufacturerValid;
  bool get isValid => _model.isValid;

  // State update methods
  void setInstallationSelected(bool? value) {
    _model.isInstallationSelected = value ?? false;
  }

  void setCallBasisSelected(bool? value) {
    _model.isCallBasisSelected = value ?? false;
  }

  void setPreventiveMaintenanceSelected(bool? value) {
    _model.isPreventiveMaintenanceSelected = value ?? false;
  }

  void setInWarrantySelected(bool? value) {
    _model.isInWarrantySelected = value ?? false;
  }

  void setInFreeServiceSelected(bool? value) {
    _model.isInFreeServiceSelected = value ?? false;
  }

  void setInAnnualSelected(bool? value) {
    _model.isInAnnualSelected = value ?? false;
  }

  void setInUPSSelected(bool? value) {
    _model.isInUPSSelected = value ?? false;
  }

  void setInGeneratorSelected(bool? value) {
    _model.isInGeneratorSelected = value ?? false;
  }

  void setInStabilizerSelected(bool? value) {
    _model.isInStabilizerSelected = value ?? false;
  }

  void setInInverterSelected(bool? value) {
    _model.isInInverterSelected = value ?? false;
  }

  void updateManufacturerName(String value) {
    _model.manufacturerName = value;
    _model.isManufacturerTouched = true;
  }
}
