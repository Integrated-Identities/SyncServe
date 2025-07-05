import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/service_checklist_model.dart';

final serviceChecklistProvider =
    StateProvider<List<ServiceChecklistItem>>((ref) => []);
