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
  bool get isSuccess =>
      feedbackLevel == FeedbackLevel.success ||
      feedbackLevel == FeedbackLevel.info;

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

  /// Conditionally executes one of the two provided callbacks,
  /// depending on whether `isSuccess` is true or false.
  ///
  /// If this [FeedbackResponse] is successful (`isSuccess` is true),
  /// then it executes the [ifSuccess] callback with itself as an argument.
  /// Otherwise, it executes the [ifError] callback with itself as an argument.
  ///
  /// Example:
  /// ```
  /// feedbackResponse.fold(
  ///   ifSuccess: (response) {
  ///     // Handle success.
  ///   },
  ///   ifError: (response) {
  ///     // Handle error.
  ///   },
  /// );
  /// ```
  ///
  /// - [ifSuccess] : A callback that is executed if this [FeedbackResponse] is successful.
  /// - [ifError] : A callback that is executed if this [FeedbackResponse] is not successful.
  void fold({
    required void Function(FeedbackResponse<T> response) ifSuccess,
    required void Function(FeedbackResponse<T> response) ifError,
  }) {
    if (isSuccess) {
      ifSuccess(this);
    } else {
      ifError(this);
    }
  }
}
