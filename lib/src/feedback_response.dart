import 'feedback_level.dart';
import 'feedback_response_interface.dart';
import 'feedback_type.dart';

/// Used to create default feedback responses as part of the feedback_response package.
///
/// If you are interested in using different [feedbackLevel]/[feedbackType] enums then consider
/// creating your own response class overriding the [FeedbackResponseInterface].
class FeedbackResponse<T extends Object?>
    extends FeedbackResponseInterface<T, FeedbackLevel, FeedbackType> {
  FeedbackResponse({
    required FeedbackLevel feedbackLevel,
    required FeedbackType feedbackType,
    String? title,
    String? message,
    T? result,
  }) : super(
          feedbackLevel: feedbackLevel,
          feedbackType: feedbackType,
          title: title,
          message: message,
          result: result,
        );

  /// Used to create a success response with a snack type of feedback.
  factory FeedbackResponse.success({
    String? title,
    String? message,
    T? result,
    FeedbackLevel feedbackLevel = FeedbackLevel.success,
    FeedbackType feedbackType = FeedbackType.notification,
  }) =>
      FeedbackResponse(
        feedbackLevel: feedbackLevel,
        title: title,
        message: message,
        feedbackType: feedbackType,
        result: result,
      );

  /// Used to create a success response without any type of feedback.
  factory FeedbackResponse.successNone({
    String? title,
    String? message,
    T? result,
    FeedbackLevel feedbackLevel = FeedbackLevel.success,
    FeedbackType feedbackType = FeedbackType.none,
  }) =>
      FeedbackResponse(
        feedbackLevel: feedbackLevel,
        title: title,
        message: message,
        feedbackType: feedbackType,
        result: result,
      );

  /// Used to create an info response with a dialog type of feedback.
  factory FeedbackResponse.info({
    String? title,
    String? message,
    T? result,
    FeedbackLevel feedbackLevel = FeedbackLevel.info,
    FeedbackType feedbackType = FeedbackType.notification,
  }) =>
      FeedbackResponse(
        feedbackLevel: feedbackLevel,
        title: title,
        message: message,
        feedbackType: feedbackType,
        result: result,
      );

  /// Used to create a warning response with a dialog type of feedback.
  factory FeedbackResponse.warning({
    String? title,
    String? message,
    T? result,
    FeedbackLevel feedbackLevel = FeedbackLevel.warning,
    FeedbackType feedbackType = FeedbackType.notification,
  }) =>
      FeedbackResponse(
        feedbackLevel: feedbackLevel,
        title: title,
        message: message,
        feedbackType: feedbackType,
        result: result,
      );

  /// Used to create an error response with a dialog type of feedback.
  factory FeedbackResponse.error({
    String? title,
    String? message,
    T? result,
    FeedbackLevel feedbackLevel = FeedbackLevel.error,
    FeedbackType feedbackType = FeedbackType.dialog,
  }) =>
      FeedbackResponse(
        feedbackLevel: feedbackLevel,
        title: title,
        message: message,
        feedbackType: feedbackType,
        result: result,
      );

  /// Used to create an error response without any type of feedback.
  factory FeedbackResponse.errorNone({
    String? title,
    String? message,
    T? result,
    FeedbackLevel feedbackLevel = FeedbackLevel.error,
    FeedbackType feedbackType = FeedbackType.none,
  }) =>
      FeedbackResponse(
        feedbackLevel: feedbackLevel,
        title: title,
        message: message,
        feedbackType: feedbackType,
        result: result,
      );

  @override
  bool get isSuccess => feedbackLevel == FeedbackLevel.success;

  @override
  bool get hasError => feedbackLevel == FeedbackLevel.error;

  @override
  String toString() {
    return 'FeedbackResponse{feedbackLevel: $feedbackLevel, feedbackType: $feedbackType, title: $title, message: $message, result: $result}';
  }

  /// Used to change responses if needed.
  FeedbackResponse<E> copyWith<E extends Object?>({
    FeedbackLevel? feedbackLevel,
    FeedbackType? feedbackType,
    E? result,
    String? title,
    String? message,
  }) =>
      FeedbackResponse<E>(
        feedbackLevel: feedbackLevel ?? this.feedbackLevel,
        feedbackType: feedbackType ?? this.feedbackType,
        title: title ?? this.title,
        message: message ?? this.message,
        result: result ?? this.result as E,
      );

  /// Returns a value depending on the success state of [FeedbackResponse] by
  /// applying one of the provided functions [ifSuccess] or [orElse].
  ///
  /// If the [FeedbackResponse] is successful, applies the [ifSuccess] function
  /// with `this` as an argument; otherwise, the [orElse] function is applied.
  T? fold({
    required T? Function(FeedbackResponse<T> response) ifSuccess,
    required T? Function(FeedbackResponse<T> response) orElse,
  }) {
    if (isSuccess) {
      return ifSuccess(this);
    } else {
      return orElse(this);
    }
  }
}
