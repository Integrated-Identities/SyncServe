import 'package:syncserve/enums/service_form.dart';
import 'package:syncserve/utils/flags.dart';

class ServiceFormViewModel {
  EnumFlags<ServiceReasons> reasons = EnumFlags<ServiceReasons>();
  EnumFlags<ServiceCategory> category = EnumFlags<ServiceCategory>();
  EnumFlags<ServiceSystemType> systemType = EnumFlags<ServiceSystemType>();

  String? manufacturerName;
  bool get isManufacturerValid =>
      manufacturerName != null && manufacturerName!.trim().length >= 3;

  bool get isValid =>
      isManufacturerValid &&
      !reasons.isEmpty &&
      !category.isEmpty &&
      !systemType.isEmpty;
}
