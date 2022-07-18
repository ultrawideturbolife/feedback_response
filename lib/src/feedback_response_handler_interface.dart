import '../feedback_response.dart';

/// Interface purely made as an example/indication on how to handle feedbackResponses.
///
/// Handle the responses as you see fit!
abstract class FeedbackResponseHandlerInterface {
  Future<bool?> handleFeedbackResponse(
      {required FeedbackResponseInterface feedbackResponse});
}
