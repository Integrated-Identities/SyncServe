import 'package:flutter/material.dart';

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
