import 'package:syncserve/enums/service_form.dart';

class ServiceFormModel {
  ServiceFormModel({
    required this.reasons,
    required this.categories,
    required this.systems,
    required this.manufacturerName,
  });

  final Set<ServiceReasons> reasons;
  final Set<ServiceCategory> categories;
  final Set<ServiceSystemType> systems;
  final String manufacturerName;
}
