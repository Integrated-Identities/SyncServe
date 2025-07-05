import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncserve/model/electrical_readings_model.dart';
import 'package:syncserve/providers/electrical_readings_providers.dart';

class ElectricalReadingsViewModel {
  // Input Voltage Controllers
  final ryController = TextEditingController();
  final ybController = TextEditingController();
  final brController = TextEditingController();

  // Input Current Controllers
  final rCurrentController = TextEditingController();
  final yCurrentController = TextEditingController();
  final bCurrentController = TextEditingController();

  // Output Voltage Controllers
  final uvController = TextEditingController();
  final vwController = TextEditingController();
  final wuController = TextEditingController();

  // Output Current Controllers
  final uCurrentController = TextEditingController();
  final vCurrentController = TextEditingController();
  final wCurrentController = TextEditingController();

  void save(WidgetRef ref) {
    final readings = ElectricalReadingsModel(
      ry: ryController.text,
      yb: ybController.text,
      br: brController.text,
      r: rCurrentController.text,
      y: yCurrentController.text,
      b: bCurrentController.text,
      uv: uvController.text,
      vw: vwController.text,
      wu: wuController.text,
      u: uCurrentController.text,
      v: vCurrentController.text,
      w: wCurrentController.text,
    );
    ref.read(electricalReadingsProvider.notifier).state = readings;
  }

  void reset() {
    ryController.clear();
    ybController.clear();
    brController.clear();
    rCurrentController.clear();
    yCurrentController.clear();
    bCurrentController.clear();
    uvController.clear();
    vwController.clear();
    wuController.clear();
    uCurrentController.clear();
    vCurrentController.clear();
    wCurrentController.clear();
  }

  void dispose() {
    ryController.dispose();
    ybController.dispose();
    brController.dispose();
    rCurrentController.dispose();
    yCurrentController.dispose();
    bCurrentController.dispose();
    uvController.dispose();
    vwController.dispose();
    wuController.dispose();
    uCurrentController.dispose();
    vCurrentController.dispose();
    wCurrentController.dispose();
  }
}
