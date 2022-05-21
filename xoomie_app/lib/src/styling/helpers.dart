import 'package:flutter/material.dart';
import 'package:xoomie/src/styling/variables.dart';

InputBorder createInputBorder({
  required Color borderColor,
}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: borderColor,
    ),
    borderRadius: BorderRadius.circular(
      borderRadiusMedium,
    ),
  );
}

MaterialStateProperty<T?> createMaterial<T>({
  T? selected,
  T? disabled,
  T? fallback,
}) {
  return MaterialStateProperty.resolveWith<T?>(
    (Set<MaterialState> states) {
      if (states.contains(
        MaterialState.disabled,
      )) return disabled ?? fallback;
      if (states.contains(
        MaterialState.selected,
      )) return selected ?? fallback;
      return fallback;
    },
  );
}
