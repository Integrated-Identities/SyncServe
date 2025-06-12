import 'package:syncserve/model/service_form_model.dart';

class ServiceFormViewModel {
  int selectedReasons = 0;
  int selectedCategory = 0;
  int selectedSystemType = 0;

  String? manufacturerName;
  bool isManufacturerTouched = false;

  bool isSelected(ServiceReasons reason) => (selectedReasons & reason.bit) != 0;
  void toggleReason(ServiceReasons reason) => selectedReasons ^= reason.bit;

  bool isSelectedCategory(ServiceCategory category) =>
      (selectedCategory & category.bit) != 0;
  void toggleCategory(ServiceCategory category) =>
      selectedCategory ^= category.bit;

  bool isSelectedSystemType(ServiceSystemType type) =>
      (selectedSystemType & type.bit) != 0;
  void toggleSystemType(ServiceSystemType type) =>
      selectedSystemType ^= type.bit;
  bool get isManufacturerValid =>
      isManufacturerTouched &&
      manufacturerName != null &&
      manufacturerName!.trim().length >= 3;

  bool get hasSelectedReason => selectedReasons != 0;
  bool get hasSelectedCategory => selectedCategory != 0;
  bool get hasSelectedSystemType => selectedSystemType != 0;

  bool get isValid =>
      isManufacturerValid &&
      hasSelectedReason &&
      hasSelectedCategory &&
      hasSelectedSystemType;
}
