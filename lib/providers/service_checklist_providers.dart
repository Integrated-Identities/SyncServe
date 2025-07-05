import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/enums/service_checklist.dart';
import 'package:syncserve/utils/flags.dart';

final serviceChecklistProvider =
    StateProvider<EnumFlags<ServiceChecklistFlag>>((ref) => EnumFlags());
