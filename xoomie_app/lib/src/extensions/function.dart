import 'dart:ui';

extension VoidCallbackExtensions on VoidCallback {
  VoidCallback? when({
    required bool condition,
  }) {
    if (condition) return this;
    return null;
  }
}
