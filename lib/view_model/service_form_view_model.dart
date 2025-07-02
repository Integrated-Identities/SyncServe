import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/service_form_model.dart';
import 'package:syncserve/providers/service_form_providers.dart';
import 'package:syncserve/enums/service_form.dart';
import 'package:syncserve/utils/flags.dart';

class ServiceFormViewModel {
  void save(WidgetRef ref) {
    final model = ServiceFormModel(
      reasons: reasons,
      categories: category,
      systems: systemType,
      manufacturerName: manufacturerName!.trim(),
    );
    ref.read(serviceFormProvider.notifier).state = model;
  }

  void reset() {
    manufacturerName = null;
    reasons = EnumFlags<ServiceReasons>();
    category = EnumFlags<ServiceCategory>();
    systemType = EnumFlags<ServiceSystemType>();
  }

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
