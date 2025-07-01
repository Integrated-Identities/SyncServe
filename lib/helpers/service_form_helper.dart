import 'package:flutter_riverpod/flutter_riverpod.dart';

void toggleItem<T>(
  WidgetRef ref,
  StateProvider<Set<T>> provider,
  T item,
  bool? isChecked,
) {
  final current = ref.read(provider);
  final updated = Set<T>.from(current);

  isChecked == true ? updated.add(item) : updated.remove(item);

  ref.read(provider.notifier).state = updated;
}
