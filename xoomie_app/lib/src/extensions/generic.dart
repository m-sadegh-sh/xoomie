extension Generic<T> on T {
  T? when({
    required bool condition,
  }) {
    if (condition) return this;
    return null;
  }
}
