import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/enums/service_form.dart';
import 'package:syncserve/model/service_form_model.dart';

final serviceFormProvider = StateProvider<ServiceFormModel?>((ref) => null);

final visitReasonProvider = StateProvider<Set<ServiceReasons>>((ref) => {});

final serviceCategoryProvider =
    StateProvider<Set<ServiceCategory>>((ref) => {});

final systemTypeProvider = StateProvider<Set<ServiceSystemType>>((ref) => {});

final manufacturerNameProvider = StateProvider<String>((ref) => '');
