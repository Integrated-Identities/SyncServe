import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/electrical_readings_model.dart';

final electricalReadingsProvider =
    StateProvider<ElectricalReadingsModel?>((ref) => null);
