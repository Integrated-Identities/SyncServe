import 'package:syncserve/interfaces/bit_flag.dart';

/// A utility class to manage a collection of flags represented as bitwise operations.
class EnumFlags<T extends BitFlag> {
  EnumFlags([this._value = 0]);

  /// The internal integer value representing the combined flags.
  int _value;

  /// Adds a flag to the collection.
  void add(T flag) => _value |= flag.value;

  /// Removes a flag from the collection.
  void remove(T flag) => _value &= ~flag.value;

  /// Checks if a specific flag is present in the collection.
  bool contains(T flag) => (_value & flag.value) != 0;

  /// Checks if the collection contains any flags.
  bool get isEmpty => _value == 0;

  /// Gets the current value of the flags as a List of Enums.
  List<T> getActive(List<T> allFlags) =>
      allFlags.where((f) => contains(f)).toList();
}
