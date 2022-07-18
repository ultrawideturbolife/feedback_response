/// Used to create your own [FeedbackResponse] in case [feedbackLevel] and [feedbackType] are not sufficient.
abstract class FeedbackResponseInterface<T extends Object?, N extends Enum,
    F extends Enum> {
  FeedbackResponseInterface({
    required this.feedbackLevel,
    required this.feedbackType,
    this.title,
    this.message,
    this.result,
  });

  /// Used to determine the feedback level/notification level towards the user.
  ///
  /// Examples: success, info, warning, error
  final N feedbackLevel;

  /// Used to determine the feedback type/notification type towards the user.
  ///
  /// Examples: dialog, snackbar, bottomSheet, none
  final F feedbackType;

  /// Used to provide a title for the type of feedback.
  final String? title;

  /// Used to provide a message for the type of feedback.
  final String? message;

  /// Used to provide a result.
  final T? result;

  /// Indicates whether the response is a successful.
  bool get isSuccess;

  /// Parses the response to any desired [E].
  ///
  /// Although convenient - use with caution, this is blind casting!
  E resultAsCast<E>() => result as E;
}
