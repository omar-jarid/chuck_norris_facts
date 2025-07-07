import 'package:flutter/foundation.dart';

@immutable
class BaseError {
  final Exception error;
  const BaseError(this.error);
}

@immutable
class BaseSuccess<T> {
  final T result;
  const BaseSuccess(this.result);
}
