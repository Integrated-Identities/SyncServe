import 'package:syncserve/enums/service_form.dart';
import 'package:syncserve/utils/flags.dart';

class ServiceFormModel {
  ServiceFormModel({
    required this.reasons,
    required this.categories,
    required this.systems,
    required this.manufacturerName,
  });

  final EnumFlags<ServiceReasons> reasons;
  final EnumFlags<ServiceCategory> categories;
  final EnumFlags<ServiceSystemType> systems;
  final String manufacturerName;
}
